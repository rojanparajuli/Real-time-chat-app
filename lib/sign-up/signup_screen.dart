import 'package:chat/components/my_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  final authService = Get.find<AuthService>();

  void signUp() async {
    if (passwordController.text != confirmPassController.text) {
      Get.snackbar("Error", "Password do not match",
          snackBarClose: true);
      return;
    }
    try {
      await authService.signUpWithEmailAndPassword(
          emailController.text, passwordController.text, nameController.text);
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackBarClose: true);
    }
  }
}

class SignupPageView extends StatelessWidget {
  const SignupPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupPage controller = Get.put(SignupPage());

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
                width: 180,
                child: Image.asset("assets/images/chat.png"),
              ),
              const Text(
                "Create New Account!",
                style: TextStyle(color: Colors.white),
              ),

              //actual form for signup---------------

              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //name
                          TextFormField(
                            controller: controller.nameController,
                            decoration: const InputDecoration(
                              labelText: "User name",
                            ),
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                          ),
                          //email
                          TextFormField(
                            controller: controller.emailController,
                            decoration: const InputDecoration(
                              labelText: "Email Address ",
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return "please enter valid email address";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                          ),
                          //password
                          TextFormField(
                            controller: controller.passwordController,
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
                          //confirm password
                          TextFormField(
                            controller: controller.confirmPassController,
                            obscuringCharacter: "*",
                            decoration: const InputDecoration(
                              labelText: " consfirm Password",
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
                          MyBtn(onpressed: controller.signUp, text: "Sign Up"),
                          TextButton(
                              onPressed: Get.back,
                              child: const Text(
                                  "Already have an account? Login")),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
