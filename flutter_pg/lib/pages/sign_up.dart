// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import "package:flutter_pg/services/auth.dart";
import "package:flutter_pg/widgets/sign_in_form.dart";
import "package:go_router/go_router.dart";

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void signUp(user, password) {
    dynamic res = AuthService().registerWithPassword(user, password);
    if (res == null) {
      print("\nError\n");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(''),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () {
              GoRouter.of(context).go('/login');
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SignInForm(
            btnText: 'Sign Up',
            actionBtn: signUp,
          ),
        ),
      ),
    );
  }
}
