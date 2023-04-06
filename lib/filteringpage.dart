import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:ui/resultPage.dart';

import 'detailpage.dart';

//import 'categorypage.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // reference for collection/table in db (REQUIRED!)
  final CollectionReference _dishes =
      FirebaseFirestore.instance.collection('dishes');
  List<String> selectedFilters = [];

  String? selectedCategory;
  String? selectedHealth = 'Standard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter/Basket MVP',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // const Text('select category:'),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: const [
                DropdownMenuItem(
                  value: 'Chicken',
                  child: Text('Chicken'),
                ),
                DropdownMenuItem(
                  value: 'Egg',
                  child: Text('Egg'),
                ),
                DropdownMenuItem(
                  value: 'Beef',
                  child: Text('Beef'),
                ),
              ],
              onChanged: (value) {
                setState(
                  () {
                    selectedCategory = value;
                  },
                );
              },
              decoration: const InputDecoration(
                labelText: 'Select a category', // set the label text
                border: OutlineInputBorder(), // add an outline border
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10), // add padding
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //health option
            // const Text('select health option:'),
            DropdownButtonFormField<String>(
              value: selectedHealth,
              items: const [
                DropdownMenuItem(
                  value: 'Standard',
                  child: Text('Standard'),
                ),
                DropdownMenuItem(
                  value: 'Arthritis',
                  child: Text('Arthritis'),
                ),
                DropdownMenuItem(
                  value: 'Vegan',
                  child: Text('Vegan'),
                ),
              ],
              onChanged: (value) {
                setState(
                  () {
                    selectedHealth = value;
                  },
                );
              },
              decoration: const InputDecoration(
                labelText: 'Select a health option', // set the label text
                border: OutlineInputBorder(), // add an outline border
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10), // add padding
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _dishes
                    .orderBy('name', descending: false)
                    .where('category', isEqualTo: selectedCategory)
                    .where('diet', arrayContains: selectedHealth)
                    .snapshots(), //connects to DB //build connection
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData &&
                      streamSnapshot.data!.docs.isNotEmpty) {
                    return ListView.builder(
                      //controller: _scrollController,
                      shrinkWrap: true,
                      //physics: const NeverScrollableScrollPhysics(),
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 10.0,
                          ),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadowColor: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0,
                              ),
                              child: Column(
                                children: [
                                  ListTile(
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
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              documentSnapshot['imgUrl']),
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
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: Text('No cuisine or recipe'),
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
