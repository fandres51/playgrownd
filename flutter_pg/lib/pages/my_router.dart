import "package:flutter/material.dart";
import "package:flutter_pg/models/custom_user.dart";
import "package:flutter_pg/pages/home_page.dart";
import "package:flutter_pg/pages/sign_in.dart";
import "package:provider/provider.dart";

class MyRouter extends StatelessWidget {
  const MyRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);

    if (user != null) {
      return HomePage();
    } else {
      return const SignInScreen();
    }
  }
}
