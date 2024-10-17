import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class TreinoMasculino1 extends StatefulWidget {
  const TreinoMasculino1({super.key});

  @override
  State<TreinoMasculino1> createState() => _TreinoMasculino1State();
}

class _TreinoMasculino1State extends State<TreinoMasculino1> {
  /* pegaDados() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } */

  final CollectionReference _receitas =
      FirebaseFirestore.instance.collection('Masculino1');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/inicialMasc.jpg'),
            fit: BoxFit.fill,
            opacity: 30),
      ),
      child: StreamBuilder(
          stream: _receitas.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
            if (streamSnapShot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapShot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapShot.data!.docs[index];
                    return Column(
                      children: [
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  "Segunda:\n",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  style: TextStyle(fontSize: 20),
                                  documentSnapshot['seg']
                                      .toString()
                                      .replaceAll("_b", "\n"),
                                ),
                              ])),
                        ),
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  "Terça:\n",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  style: TextStyle(fontSize: 20),
                                  documentSnapshot['ter']
                                      .toString()
                                      .replaceAll("_b", "\n"),
                                ),
                              ])),
                        ),
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  "Quarta:\n",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  style: TextStyle(fontSize: 20),
                                  documentSnapshot['qua']
                                      .toString()
                                      .replaceAll("_b", "\n"),
                                ),
                              ])),
                        ),
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  "Quinta:\n",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  style: TextStyle(fontSize: 20),
                                  documentSnapshot['qui']
                                      .toString()
                                      .replaceAll("_b", "\n"),
                                ),
                              ])),
                        ),
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  "Sexta:\n",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  style: TextStyle(fontSize: 20),
                                  documentSnapshot['sex']
                                      .toString()
                                      .replaceAll("_b", "\n"),
                                ),
                              ])),
                        ),
                        Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  "Sabado:\n",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  style: TextStyle(fontSize: 20),
                                  documentSnapshot['sab']
                                      .toString()
                                      .replaceAll("_b", "\n"),
                                ),
                              ])),
                        ),
                      ],
                    );
                  }));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
