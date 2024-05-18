import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_18/pages/signin/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final formKey = GlobalKey<FormState>();

  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Yoshingizni kiriting: ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.teal),
                  ),
                ),
                validator: (value) {
                  try {
                    int.parse(value!);
                  } on FormatException {
                    return 'Faqat butun son kiriting!';
                  } catch (e) {
                    return e.toString();
                  }
                  if (int.parse(ageController.text) < 0) {
                    return "0 dan kichik kiritib bo'lmaydi!";
                  } else if (int.parse(ageController.text) > 100) {
                    return "100 dan katta kiritib bo'lmaydi!";
                  } else if (value.isEmpty) {
                    return "Yosh kiriting!";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) =>
                            Century(age: int.parse(ageController.text)),
                      ),
                    );
                  }
                },
                child: const Text('Hisobla'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Century extends StatelessWidget {
  const Century({super.key, required this.age});

  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Happy 100 yosh!'),
      ),
      body: Center(
        child: Text(
          age == 100
              ? "Siz yetib keldingiz!"
              : "100 yoshga kirishingiz uchun yana ${100 - age} yil yashashingiz kerak.",
        ),
      ),
    );
  }
}
