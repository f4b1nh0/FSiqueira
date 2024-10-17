import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myworkout/screens/auth_page.dart';
import 'package:myworkout/screens/cards.dart';

class Logado extends StatefulWidget {
  const Logado({super.key});

  @override
  State<Logado> createState() => _LogadoState();
}

class _LogadoState extends State<Logado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Cards();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
