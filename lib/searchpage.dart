// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'detailpage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // reference for collection/table in db (REQUIRED!)
  final CollectionReference _dishes =
      FirebaseFirestore.instance.collection('dishes');
  void updateList(String value) {}
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_scrollController.offset >= 100) {
      // change 100 to your desired offset
      setState(() {
        _showFloatingButton = true;
      });
    } else {
      setState(() {
        _showFloatingButton = false;
      });
    }
  }

  void _onSearchChanged() {
    print(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  bool _showFloatingButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Find your dish',
          style: TextStyle(
            fontSize: 25,
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
          bottom: 20,
        ),
        child: Column(
          children: [
            TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                setState(() {});
              },
              controller: _searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                ),
                hintText: "Type dish name",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: _dishes
                  .where('name', isGreaterThanOrEqualTo: _searchController.text)
                  .snapshots(), //connects to DB //build connection
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      controller: _scrollController,
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
                            title: Text(documentSnapshot['name']),
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
                    ),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: _showFloatingButton
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
