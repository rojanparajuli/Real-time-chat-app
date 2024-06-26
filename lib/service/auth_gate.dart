import 'package:chat/main.dart';
import 'package:chat/service/loginorsignup.dart';
import 'package:chat/view/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return  HomePage();
          }
          //user is not logged in
          else {
            return const LoginOrSignup();
          }
        },
      ),
    );
  }
}
