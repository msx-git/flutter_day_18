import 'package:flutter/material.dart';
import 'package:flutter_day_18/main.dart';
import 'package:flutter_day_18/utils/extensions.dart';

import '../home/home.dart';

class AuthConfirmation extends StatelessWidget {
  const AuthConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            const SafeArea(child: Text('Register')),
            10.height,
            const Text("Create your account for your schedule"),
            10.height,
            const Spacer(),
            Center(
              child: Container(
                // height: 400,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 300,
                        color: Colors.black.withOpacity(0.2)),
                  ],
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    30.height,
                    const Icon(Icons.check_circle_outline_rounded, size: 70),
                    20.height,
                    const Text('Your account has active'),
                    20.height,
                    const Text(
                      "Congratulation, you are success to change your profile.",
                      textAlign: TextAlign.center,
                    ),
                    20.height,
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(color: Colors.blue),
                        alignment: Alignment.center,
                        child: const Text(
                          'Ok',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    30.height,
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(color: Colors.blue),
              alignment: Alignment.center,
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white),
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
    );
  }
}
