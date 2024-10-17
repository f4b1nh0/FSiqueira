import 'package:myworkout/screens/login.dart';
import 'package:myworkout/screens/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginpage = true;

  void toggLeScreen() {
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return Login(showRegisterPage: toggLeScreen);
    } else {
      return RegisterPage(showLoginPage: toggLeScreen);
    }
  }
}
