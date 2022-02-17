import 'package:flutter/material.dart';
import 'package:miarma_app_flutter/pages/login_page.dart';
import 'package:miarma_app_flutter/pages/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const LoginPage(),
        '/sign-in': (context) => const SignInPage()
      },
    );
  }
}
