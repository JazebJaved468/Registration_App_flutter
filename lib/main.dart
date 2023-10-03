import 'package:flutter/material.dart';
import 'package:registration_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

