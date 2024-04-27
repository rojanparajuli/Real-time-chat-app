import 'package:chat/view/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../sign-up/signup_screen.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
//initially login page
  bool showLoginPage = true;

  //toggle between login and signup page
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return AuthScreen(onTap: togglePage);
    } else {
      return SignupPage(onTap: togglePage);
    }
  }
}
