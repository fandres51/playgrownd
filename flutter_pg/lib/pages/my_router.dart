import "package:flutter/material.dart";
import "package:flutter_pg/models/custom_user.dart";
import "package:flutter_pg/pages/home_page.dart";
import "package:flutter_pg/pages/login.dart";
import 'package:flutter_pg/pages/sign_up.dart';
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";

_router(user) => GoRouter(routes: [
      GoRoute(
        name: 'Home',
        path: '/',
        builder: (context, state) => HomePage(),
        redirect: (context, state) => user != null ? '/' : '/login',
      ),
      GoRoute(
          name: 'Login',
          path: '/login',
          builder: (context, state) => const LoginScreen(),
          redirect: (context, state) => user != null ? '/' : '/login',
      ),
      GoRoute(
        name: 'Sign Up',
        path: '/sign-up',
        builder: (context, state) => const SignUpScreen(),
        redirect: (context, state) => user != null ? '/' : '/sign-up',
      )
    ]);

class MyRouter extends StatefulWidget {
  const MyRouter({super.key});

  @override
  State<MyRouter> createState() => _MyRouterState();
}

class _MyRouterState extends State<MyRouter> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);

    return MaterialApp.router(
      routerConfig: _router(user),
    );
  }
}
    //       if (user != null) {
    //     return HomePage();
    //   } else {
    //     if (!signInScreen) {
    //       return LoginScreen(
    //         // moveSignInScreen: moveSignInScreen,
    //       );
    //     } else {
    //       return SignInScreen(
    //         moveSignInScreen: moveSignInScreen,
    //       );
    //     }
    //   }
    // }
//   }
// }
