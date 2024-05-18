import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_18/pages/confirmation/confirmation.dart';
import 'package:flutter_day_18/utils/extensions.dart';

import '../../controllers/user_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final userController = UserController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              const SafeArea(child: Text('Register')),
              10.height,
              const Text("Create your account for your schedule"),
              10.height,

              /// Name Field
              TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'Your name'),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Enter your name!";
                  }
                  return null;
                },
              ),
              10.height,

              /// Email field
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'Your email'),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Enter your email!";
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value.trim())) {
                    return "Invalid email address!";
                  } else if (userController.checkForExistence(value.trim())) {
                    return "This email is already registered.\nEnter another email!";
                  }
                  return null;
                },
              ),
              10.height,

              /// Password Field
              TextFormField(
                controller: passwordController1,
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: const InputDecoration(hintText: '**********'),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Enter your password!";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters!";
                  }
                  return null;
                },
              ),
              10.height,

              /// Confirm Password Field
              TextFormField(
                controller: passwordController2,
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: const InputDecoration(hintText: '**********'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Re-Enter your password!";
                  } else if (value.trim() != passwordController1.text.trim()) {
                    return "Passwords didn't match!";
                  }
                  return null;
                },
              ),
              20.height,

              /// SignIn Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Sign in here'),
                  ),
                ],
              ),
              const Spacer(),

              /// Create Account Button
              GestureDetector(
                onTap: () {
                  if (!formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const AuthConfirmation(),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(color: Colors.blue),
                  alignment: Alignment.center,
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              20.height,

              /// Terms of Use & Privacy Policy
              const Align(
                  alignment: Alignment.center,
                  child: Text("By continuing, you agree to Loana's")),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Terms of Use',
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                      TextSpan(
                          text: ' & ', style: TextStyle(color: Colors.grey)),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: Colors.deepPurple),
                      )
                    ],
                  ),
                ),
              ),
              20.height,
            ],
          ),
        ),
      ),
    );
  }
}
