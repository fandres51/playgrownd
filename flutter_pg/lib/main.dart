// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pg/models/custom_user.dart';
import 'package:flutter_pg/pages/my_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_pg/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: const MyRouter(),
    );
  }
}
