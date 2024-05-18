import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_18/controllers/user_controller.dart';
import 'package:flutter_day_18/pages/signup/sign_up.dart';
import 'package:flutter_day_18/utils/extensions.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final userController = UserController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              const SafeArea(child: Text('Welcome back')),
              10.height,
              const Text("Let's Login to Connect your email"),
              10.height,

              /// Email Field
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration:
                    const InputDecoration(hintText: 'name@example@gmail.com'),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Enter your email!";
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value.trim())) {
                    return "Invalid email address!";
                  } else if (!userController.checkForExistence(value.trim())) {
                    return "Email not found";
                  }
                  return null;
                },
              ),
              10.height,

              /// Password Field
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: '*********'),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Enter your password!";
                  } else if (!userController.authSuccess(
                      emailController.text.trim(), value.trim())) {
                    return "Incorrect Password";
                  }
                  return null;
                },
              ),
              10.height,
              const Text('Forget your password?'),
              30.height,

              /// SignUp Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: const Text('Sign up here'),
                  ),
                ],
              ),
              const Spacer(),

              /// Login Button
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(
                          builder: (context) => const Text('Logged In')),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(color: Colors.blue),
                  alignment: Alignment.center,
                  child: const Text(
                    'Log in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              10.height,

              /// Social Media Login
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.grey),
                      alignment: Alignment.center,
                      child: const Text(
                        'Log in',
                      ),
                    ),
                  ),
                  20.width,
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.grey),
                      alignment: Alignment.center,
                      child: const Text(
                        'Log in',
                      ),
                    ),
                  ),
                ],
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
                      TextSpan(text: ' & ', style: TextStyle(color: Colors.grey)),
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
