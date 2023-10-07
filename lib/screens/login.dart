import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registration_app/screens/home.dart';
import 'package:registration_app/screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // checks
  bool isLoader = false;
  bool isregistered = false;
  bool isSignupPressed = false;
  String message = "";

  // sign-in method
  Future signInUser() async {
    String emailAddress = emailController.text.trim();
    String password = passwordController.text.trim();

    isLoader = true;
    setState(() {});
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      isLoader = false;

      // navifating to home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        message = "No user found for that email";
      } else if (e.code == 'wrong-password') {
        message = "Wrong password provided for that user";

        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Register()),
                  );
                },
                child: Text("Register"))
          ],
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                //email
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),

                //password
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    // print(emailController.text);
                    // print(passwordController.text);

                    signInUser();
                  },
                  child: Text("SignIn"),
                ),

                isLoader
                    ? CircularProgressIndicator(
                        color: Colors.deepPurpleAccent,
                      )
                    : Text(""),

                Text('$message'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
