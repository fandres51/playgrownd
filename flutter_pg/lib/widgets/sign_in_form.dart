import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  final String btnText;
  final Function actionBtn;

  const SignInForm({
    super.key,
    required this.btnText,
    required this.actionBtn,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  String user = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter your email' : null,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() => user = value);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              validator: (value) => value!.length < 6
                  ? 'Enter a password with more than 6 characters'
                  : null,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: (value) {
                setState(() => password = value);
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.actionBtn(user, password);
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                elevation: 0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    Text(widget.btnText, style: const TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ));
  }
}
