import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui/detail_page.dart';

class FishPage extends StatefulWidget {
  const FishPage({super.key});

  @override
  State<FishPage> createState() => _FishPageState();
}

class _FishPageState extends State<FishPage> {
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

  // void displayTotalNumberOfDocuments() async {
  //   QuerySnapshot querySnapshot = await _dishes.get();
  //   int totalDocuments = querySnapshot.size;
  // }

  //chips for filtering Fish diet options
  // String? _selectedDiet = 'Standard';
  final List<String> _dietOptions = const [
    'Standard',
    'Arthritis',
    'Diabetic',
    'Weight-reduction'
  ];
  final List<String> _selectedDiet = ['Standard'];
  String? selectedHealthOption = 'Standard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //category name
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        // actions: <Widget>[
        //   PopupMenuButton<String>(
        //     icon: const Icon(Icons.filter_list),
        //     onSelected: (String value) {
        //       setState(() {
        //         selectedHealthOption = value;
        //       });
        //     },
        //     itemBuilder: (BuildContext context) {
        //       return {'Standard', 'Arthritis', 'Diabetic', 'Weight-reduction'}
        //           .map((String choice) {
        //         return PopupMenuItem<String>(
        //           value: choice,
        //           child: Text(choice),
        //         );
        //       }).toList();
        //     },
        //   ),
        // ],
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
            // Banner image
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: const Image(
                  image: AssetImage(
                    'assets/banners/banner_per_page/fish.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //filter chips
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  runAlignment: WrapAlignment.spaceEvenly,
                  clipBehavior: Clip.antiAlias,
                  spacing: 2.0,
                  children: _dietOptions.map((option) {
                    return FilterChip(
                      label: Text(option),
                      checkmarkColor: Colors.green,
                      showCheckmark: true, // add showCheckmark property
                      selectedColor: const Color.fromARGB(255, 253, 216, 192),
                      selected: _selectedDiet.contains(option), // fix here

                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            if (_selectedDiet.length < 2) {
                              _selectedDiet.add(option);
                            } else {
                              _selectedDiet[0] = _selectedDiet[1];
                              _selectedDiet[1] = option;
                            }
                          } else {
                            _selectedDiet.remove(option);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Selected diet: ${_selectedDiet.join(', ')}"),
            const SizedBox(
              height: 10,
            ),
            //Display fish recipe
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _dishes
                    .orderBy('name', descending: false)
                    .where("category", isEqualTo: "Fish")
                    .where('diet', arrayContainsAny: _selectedDiet)
                    .snapshots(), //connects to DB //build connection

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
                                vertical: 15.0,
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
