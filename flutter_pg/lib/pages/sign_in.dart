// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import "package:flutter_pg/services/auth.dart";

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: OutlinedButton(
                onPressed: () async {
                  dynamic user = await AuthService().signInAnonymous();
                  if (user == null) {
                    print('error signing in');
                  } else {
                    print('signed in');
                    print('User ID: ${user.uid}');
                  }
                },
                child: const Text('Sign In'))));
  }
}
