// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import "package:flutter_pg/pages/loading_page.dart";
import "package:flutter_pg/services/auth.dart";
import "package:flutter_pg/widgets/sign_in_form.dart";
import "package:go_router/go_router.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  void signInWithPassword(user, password) {
    setState(() => loading = true);
    AuthService().signInWithPassword(user, password);
  }

  void goToSignUpScreen() {
    GoRouter.of(context).go('/sign-up');
  }

  void signInAsGuest() {
    setState(() => loading = true);
    AuthService().signInAnonymous();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const LoadingPage()
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 32),
                    SignInForm(
                        btnText: 'Sign In', actionBtn: signInWithPassword),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: goToSignUpScreen,
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: signInAsGuest,
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      icon: const Icon(Icons.person, color: Colors.black54),
                      label: const Text('Sign In as Guest',
                          style: TextStyle(color: Colors.black54)),
                    ),
                  ]),
            ),
          );
  }
}
