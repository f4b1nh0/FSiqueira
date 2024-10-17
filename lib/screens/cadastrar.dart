import 'package:flutter/material.dart';

class Cadastrar extends StatelessWidget {
  const Cadastrar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF9CB7AF), Color(0xFF2CAB88)])),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "CADASTRE-SE",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.all(10)),
          SizedBox(
            height: 35,
            width: 350,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.email),
                  hintText: 'Informe seu e-mail'),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          SizedBox(
            height: 35,
            width: 350,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.key),
                  hintText: 'Informe sua senha'),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(padding: EdgeInsets.all(16)),
        ],
      ),
    ));
  }
}
