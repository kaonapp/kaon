import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui/detailpage.dart';

class PorkPage extends StatefulWidget {
  const PorkPage({super.key});

  @override
  State<PorkPage> createState() => _PorkPageState();
}

class _PorkPageState extends State<PorkPage> {
  // reference for collection/table in db (REQUIRED!)
  final CollectionReference _dishes =
      FirebaseFirestore.instance.collection('dishes');

  // Scroll to top controller
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
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

  bool _showFloatingButton = false;

//chips for filtering Pork diet options
  String? _selectedDiet = 'Standard';
  final List<String> _dietOptions = const [
    'Standard',
    'Arthritis',
    'Diabetic',
    'Weight-reduction'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //category name
        title: const Text(
          'Pork',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
          bottom: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.spaceEvenly,
                clipBehavior: Clip.antiAlias,
                spacing: 2.0,
                children: _dietOptions.map((option) {
                  return FilterChip(
                    label: Text(option),
                    selected: _selectedDiet == option,
                    onSelected: (selected) {
                      setState(() {
                        _selectedDiet = selected ? option : 'Standard';
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Selected diet: $_selectedDiet"),
            const SizedBox(
              height: 10,
            ),
            //Display chicken recipe
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _dishes
                    .orderBy('name', descending: false)
                    .where("category", isEqualTo: "Pork")
                    .where('diet', arrayContains: _selectedDiet)
                    .snapshots(), //connects to DB //build connection for Chicken
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      controller: _scrollController,
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
