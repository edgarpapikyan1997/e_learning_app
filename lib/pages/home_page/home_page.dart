import 'package:e_learning_app/pages/sign_in/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: ElevatedButton(
          child: Text('logout'),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                ));
          },
        )),
      ),
    );
  }
}
