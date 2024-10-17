// ignore_for_file: sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myworkout/screens/auth_page.dart';
import 'package:myworkout/screens/semana_hiper_fem.dart';
import 'package:myworkout/screens/semana_hiper_masc.dart';
import 'package:myworkout/screens/meus_cards.dart';
import 'package:myworkout/screens/videos/execucao.dart';
import 'package:myworkout/tortas/card_receita.dart';
import 'package:page_transition/page_transition.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  Logout() {
    FirebaseAuth.instance.signOut();
    return Navigator.push(
        context, MaterialPageRoute(builder: ((context) => AuthPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Workout"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              onPressed: Logout,
              icon: Icon(
                Icons.logout,
                color: Colors.grey,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          child: const Semana_Hi_Masc(),
                          type: PageTransitionType.leftToRight),
                    ),
                    child: MeuCard(
                        minhaImagem: 'assets/images/hipertrofia_masculina.jpg'),
                  ),
                  Text("Treino Masculino"),
                  Divider(),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          child: const Semana_Hi_Fem(),
                          type: PageTransitionType.leftToRight),
                    ),
                    child: MeuCard(
                        minhaImagem: 'assets/images/hipertrofia_feminina.jpg'),
                  ),
                  Text("Treino Feminino"),
                  Divider(),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          child: const Execucao(),
                          type: PageTransitionType.leftToRight),
                    ),
                    child: MeuCard(minhaImagem: 'assets/images/dicas.jpg'),
                  ),
                  Text("Execução de exercícios"),
                  Divider(),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          child: const CardReceita(),
                          type: PageTransitionType.fade),
                    ),
                    child:
                        MeuCard(minhaImagem: 'assets/images/receita_fit.jpg'),
                  ),
                  Text("Receitas Fitness"),
                  Divider(),
                ]),
          ),
        ),
      ),
    );
  }
}
