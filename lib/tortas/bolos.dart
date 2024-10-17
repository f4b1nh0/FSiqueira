import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Bolos extends StatefulWidget {
  const Bolos({super.key});

  @override
  State<Bolos> createState() => _BolosState();
}

class _BolosState extends State<Bolos> {
  final CollectionReference _receitass =
      FirebaseFirestore.instance.collection('Bolos');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _receitass.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
            if (streamSnapShot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapShot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapShot.data!.docs[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(documentSnapshot['nome']),
                        subtitle: Text(documentSnapshot['modo de Preparo']),
                      ),
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
