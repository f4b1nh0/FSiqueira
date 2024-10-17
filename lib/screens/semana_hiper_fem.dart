// ignore_for_file: camel_case_types, non_constant_identifier_names, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myworkout/screens/auth_page.dart';
import 'package:myworkout/screens/treinos/treino_feminino1.dart';
import 'package:myworkout/screens/treinos/treino_feminino2.dart';
import 'package:page_transition/page_transition.dart';

class Semana_Hi_Fem extends StatefulWidget {
  const Semana_Hi_Fem({super.key});

  @override
  State<Semana_Hi_Fem> createState() => _Semana_Hi_FemState();
}

class _Semana_Hi_FemState extends State<Semana_Hi_Fem> {
  Logout() {
    FirebaseAuth.instance.signOut();
    return Navigator.push(
        context, MaterialPageRoute(builder: ((context) => AuthPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha a semana do treino"),
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/inicialFem.jpg'),
              fit: BoxFit.fill,
              opacity: 20),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Quando o objetivo é perder gordura, ou alcançar a tão comentada “definição muscular”, temos que realizar treinos bem específicos para isso.",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Caso perca algum treino durante a semana, não tente compensa-lo no dia seguinte. Prossiga com a programação estipulada para o restante da semana. Para que possamos causar bastante estresse muscular, os exercícios contam com alguns sistemas de intensificação. Lembre-se que buscamos a falha muscular ou algo bem próximo a ela, portanto certifique-se de alcança-la na faixa de repetições estipulada",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              PageTransition(
                                  child: const TreinoFeminino1(),
                                  type: PageTransitionType.scale,
                                  alignment: Alignment.center,
                                  duration: const Duration(milliseconds: 600)),
                            ),
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset(
                                'assets/images/fem1.png',
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                          ),
                          Text("Semana 1 - 3",
                              style: TextStyle(color: Colors.white)),
                          Divider(),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              PageTransition(
                                  child: const TreinoFeminino2(),
                                  type: PageTransitionType.scale,
                                  alignment: Alignment.center,
                                  duration: const Duration(milliseconds: 600)),
                            ),
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset(
                                'assets/images/fem2.png',
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                          ),
                          Text("Semana 4 - 6",
                              style: TextStyle(color: Colors.white)),
                          Divider(),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
