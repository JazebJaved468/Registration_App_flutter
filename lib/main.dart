import 'package:flutter/material.dart';
import 'package:registration_app/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:registration_app/screens/register.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Register(),
    );
  }
}
