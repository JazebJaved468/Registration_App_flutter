import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:registration_app/screens/login.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final uid;
  late final uemail;
  dynamic userData = "";

  // Signout
  Future signOut() async {
    await FirebaseAuth.instance.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  void initState() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      uid = user.uid;
      uemail = user.email;
    }

    // userData = FirebaseFirestore.instance.collection("users").doc(uemail).get();
    // print(userData.data());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            actions: [
              TextButton(
                onPressed: () {
                  signOut();
                },
                child: Text(
                  "SignOut",
                ),
              )
            ],
          ),
          body: FutureBuilder(
            future: userData = FirebaseFirestore.instance
                .collection("users")
                .doc(uemail)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(
                  color: Colors.deepPurpleAccent,
                );
              }
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("UID: ${data['uid']}"),
                        Text("Email: ${data['email']}"),
                        Text("Password: ${data['password']}"),
                        Text("Contact: ${data['contact']}"),
                        Text("Address: ${data['address']}"),
                      ],
                    ),
                  ),
                );
              }

              return (Text("Loading..."));
            },
          )),
    );
  }
}
