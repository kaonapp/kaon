import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../detailpage.dart';

class DiabeticPage extends StatefulWidget {
  const DiabeticPage({super.key});

  @override
  State<DiabeticPage> createState() => _DiabeticPageState();
}

class _DiabeticPageState extends State<DiabeticPage> {
  // reference for collection/table in db (REQUIRED!)
  final CollectionReference _dishes =
      FirebaseFirestore.instance.collection('dishes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Diabetic',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
          bottom: 5,
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: _dishes
              .orderBy('name', descending: false)
              .where('diet', arrayContains: "Diabetic")
              .snapshots(), //connects to DB //build connection
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];

                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              documentSnapshot: documentSnapshot,
                            ),
                          ),
                        );
                      },
                      // ignore: prefer_interpolation_to_compose_strings
                      title: Text('${index + 1}. ' + documentSnapshot['name']),
                      subtitle: Text(documentSnapshot['category'] +
                          ' / ' +
                          documentSnapshot['cookTime'].toString() +
                          ' minutes'),
                      // trailing: SizedBox(
                      //   width: 50,
                      //   child: Row(
                      //     // ignore: prefer_const_literals_to_create_immutables
                      //     children: [
                      //       ConstrainedBox(
                      //         constraints: const BoxConstraints(
                      //           minWidth: 40,
                      //           minHeight: 44,
                      //           maxWidth: 50,
                      //           maxHeight: 64,
                      //         ),
                      //         child: Image.network(
                      //           documentSnapshot['imgUrl'],
                      //         ),
                      //       ),
                      //       // IconButton(
                      //       //   color: Colors.greenAccent,
                      //       //   icon: const Icon(Icons.remove_red_eye_rounded),
                      //       //   onPressed: () => Navigator.push(
                      //       //     context,
                      //       //     MaterialPageRoute(
                      //       //       builder: (context) => DetailPage(
                      //       //         documentSnapshot: documentSnapshot,
                      //       //       ),
                      //       //     ),
                      //       //   ),
                      //       // ),
                      //     ],
                      //   ),
                      // ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
