// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  //final String nome = 'nome';
  //const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference usuario =
      FirebaseFirestore.instance.collection('Receitas');

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return usuario
        .add({
          'nome': 'fabin',
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void pegarDados() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Receitas').get();
    snapshot.docs.forEach((d) {
      print(d.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Logado' + user.email!),
          GestureDetector(
            onTap: pegarDados,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Add pessoa',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
