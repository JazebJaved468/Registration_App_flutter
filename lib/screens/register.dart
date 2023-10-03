import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:registration_app/screens/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // checks
  bool isLoader = false;
  bool isregistered = false;
  bool isSignupPressed = false;
  String message = "";


  // signup method
  Future createUser() async {
    // isSignupPressed = true;
    isLoader = true;
    setState(() {});
    print("after set state");
    String emailAddress = emailController.text.trim();
    String password = passwordController.text.trim();

    print("object");

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      isLoader = false;
      // isregistered = true;
      message = "User registered succesfully";
      setState(() {});
      print(credential);
    } on FirebaseAuthException catch (e) {
      // print(e);
      isLoader = false;
      setState(() {});
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        message = "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        message = "The account already exists for that email";
      } else if (e.code == 'invalid-email') {
        message = "The email address is badly formatted";
      }
    } catch (e) {
      isLoader = false;
      message = "$e";
      setState(() {});
      // print("print $e");
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   duration: const Duration(seconds: 1),
      //   content: Text(
      //     "$e",
      //     style: const TextStyle(
      //       color: Color.fromARGB(255, 25, 235, 246),
      //     ),
      //   ),
      // ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Text("Login"))
          ],
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                //email
                TextField(
                  controller: emailController,
                ),

                //password
                TextField(
                  controller: passwordController,
                ),

                ElevatedButton(
                  onPressed: () {
                    // print(emailController.text);
                    // print(passwordController.text);

                    createUser();
                  },
                  child: Text("SignUp"),
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
