import 'package:flutter/material.dart';
import 'package:shopping_app/MyHomePage.dart';
import 'package:shopping_app/SignUp.dart';
import 'package:shopping_app/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Signup(title: 'Flutter Demo Home Page'),
    );
  }
}