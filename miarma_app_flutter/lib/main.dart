import 'package:flutter/material.dart';
import 'src/ui/pages/login_page.dart';
import 'src/ui/pages/menu_page.dart';
import 'src/ui/pages/signup_page.dart';

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
        '/home-page': (context) => const MenuPage(),
        '/': (context) => const LoginPage(),
        '/sign-in': (context) => const SignInPage()
      },
    );
  }
}
