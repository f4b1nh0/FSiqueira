import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardReceita extends StatefulWidget {
  const CardReceita({super.key});

  @override
  State<CardReceita> createState() => _CardReceitaState();
}

class _CardReceitaState extends State<CardReceita> {
  final CollectionReference _receitas =
      FirebaseFirestore.instance.collection('Bolos');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                        Container(
                          decoration: BoxDecoration(color: Color(0xFFC0C0C0)),
                          child: Column(children: [
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              documentSnapshot['imagem']),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text(documentSnapshot['tempo'])],
                            ),
                            Text(
                              documentSnapshot['nome']
                                  .toString()
                                  .replaceAll("_b", "\n"),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              style: TextStyle(fontSize: 20),
                              'Ingredientes: ' +
                                  documentSnapshot['ingrediente']
                                      .toString()
                                      .replaceAll("_b", "\n"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              style: TextStyle(fontSize: 20),
                              'Modo de Preparo: ' +
                                  documentSnapshot['modo de preparo']
                                      .toString()
                                      .replaceAll("_b", "\n"),
                            ),
                          ]),
                        ),
                      ],
                    );
                  }));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    ));
  }
}
