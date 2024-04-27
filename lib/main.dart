import 'package:chat/service/auth_gate.dart';
import 'package:chat/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: const FirebaseOptions(
    //   // apiKey: "",
    //   // appId: "",
    //   // messagingSenderId: "",
    //   // projectId: "",
    // ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 49, 28, 101),
        ),
      ),
      home: const AuthGate(),
      initialBinding: BindingsBuilder(() {
        // Bind your AuthService here
        Get.lazyPut

(() => AuthService());
      }),
    );
  }
}