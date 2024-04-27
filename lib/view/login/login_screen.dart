import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat/components/my_btn.dart';

class AuthScreen extends StatelessWidget {
  final void Function()? onTap;

  AuthScreen({super.key, required this.onTap});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void logIn() async {
    try {
      // Your login logic here
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                width: 160,
                // child: Image.asset("assets/images/chat.png"),
              ),
              const Text(
                "Welcome Back!",
                style: TextStyle(color: Colors.white),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: "Email Address ",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscuringCharacter: "*",
                          decoration: const InputDecoration(
                            labelText: "Password",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return "password must be 6 character long";
                            }
                            return null;
                          },
                        ),
                        MyBtn(onpressed: logIn, text: "Login"),
                        TextButton(
                          onPressed: onTap,
                          child: const Text("Do not have account? Sign Up"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
