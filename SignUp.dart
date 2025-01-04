import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopping_app/MyHomePage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key, required String title});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool hiddenPassword = true;
  bool hiddenConfirm = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Login Page",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/imagebackgroungd.JPEG'),
                fit: BoxFit.fill)),
        child: Center(
          child: Form(
              key: _formKey,
              child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value != null && value!.isEmpty) {
                              return 'Please enter your name';
                            } else if (!isFirstCapital(value!)) {
                              return 'First letter should be capital';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Full name",
                            border: OutlineInputBorder(),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value != null && value!.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value!.contains('@gmail.com')) {
                              return 'Email must contains @gmail.com';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value != null && value!.isEmpty) {
                              return 'Please enter your Password';
                            } else if (value!.length < 6) {
                              return 'Passwors must contains at least 6 characters';
                            }
                          },
                          obscureText: hiddenPassword,
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  togglePassword();
                                },
                                icon: Icon(hiddenPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value != null && value!.isEmpty) {
                              return 'Please confirm your Password';
                            } else if (!isEqual(
                                value!, passwordController.text)) {
                              return 'Passwors and Confirm Password doesn not match';
                            }
                          },
                          obscureText: hiddenConfirm,
                          decoration: InputDecoration(
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    toggleConfirm();
                                  },
                                  icon: Icon(hiddenConfirm
                                      ? Icons.visibility
                                      : Icons.visibility_off)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              myDialog();

                              debugPrint("You are logged");
                              debugPrint(nameController.text);
                              debugPrint(emailController.text);
                              debugPrint(passwordController.text);
                              debugPrint(confirmPasswordController.text);
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ])),
        ),
      ),
    );
  }

  togglePassword() {
    hiddenPassword = !hiddenPassword;
    setState(
      () {},
    );
  }

  toggleConfirm() {
    hiddenConfirm = !hiddenConfirm;
    setState(
      () {},
    );
  }

  bool isFirstCapital(String name) {
    String firstChar = name[0];
    return firstChar == firstChar.toUpperCase();
  }

  bool isEqual(String pass, String confirmPass) {
    return pass == confirmPass;
  }

  Future<void> myDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Hello",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          content: Text("Account created successfully",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          actions: <Widget>[
            TextButton(
              child: const Text("OK",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(
                            title: 'Shopping App',
                          )),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
