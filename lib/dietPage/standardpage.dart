import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../detailpage.dart';

class StandardPage extends StatefulWidget {
  const StandardPage({super.key});

  @override
  State<StandardPage> createState() => _StandardPageState();
}

class _StandardPageState extends State<StandardPage> {
  // reference for collection/table in db (REQUIRED!)
  final CollectionReference _dishes =
      FirebaseFirestore.instance.collection('dishes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //category name
        title: const Text(
          'Standard',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                // child: Image(
                //   image: AssetImage('assets/images/banner.png'),
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            Container(
              height: 650,
              child: StreamBuilder<QuerySnapshot>(
                stream: _dishes
                    .orderBy('name', descending: false)
                    .where("diet", arrayContains: "Standard")
                    .snapshots(), //connects to DB //build connection for Chicken
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      //physics: const NeverScrollableScrollPhysics(),
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
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
                            leading: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(documentSnapshot['imgUrl']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(
                              documentSnapshot['name'],
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              documentSnapshot['category'],
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
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
          ],
        ),
      ),
    );
  }
}
