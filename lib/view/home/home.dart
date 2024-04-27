import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logOut() {}
}

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 107, 35, 119),
        title: const Text(
          'Messenger',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: _homeController.logOut,
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 231, 208, 235),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _homeController.searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (_) {
                // Implement the search logic here
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('email',
                        isGreaterThanOrEqualTo:
                            _homeController.searchController.text)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error fetching data'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No users found'));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      var doc = snapshot.data?.docs[index];
                      return _buildUserListItem(doc!);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (auth.currentUser!.email != data['email']) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data['profilePictureUrl']),
            ),
            title: Text(
              data['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(data['email']),
            onTap: () {
              // Implement navigation to chat screen
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
