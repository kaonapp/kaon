import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:get/utils.dart';
// import 'package:ui/resultPage.dart';

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
  //List<String> selectedFilters = [];
  final TextEditingController _ingredientsController = TextEditingController();

  // String? selectedCategory;
  // String? selectedHealth = 'Standard';

  // Set initial value for ingredients
  List<String> ingredientsList = ['your ingredients'];

  @override
  void initState() {
    super.initState();
    _ingredientsController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {}

  @override
  void dispose() {
    _ingredientsController.removeListener(_onSearchChanged);
    _ingredientsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: CircleAvatar(
        //     //kaon logo here
        //     backgroundImage: AssetImage('assets/splash.png'),
        //   ),
        // ),
        title: const Text(
          'Fridge',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 3,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // const Text('select category:'),
            // Stack(children: [
            //   DropdownButtonFormField<String>(
            //     elevation: 16,
            //     decoration: const InputDecoration(
            //       labelText: 'Select a category', // set the label text
            //       border: OutlineInputBorder(), // add an outline border
            //       contentPadding: EdgeInsets.symmetric(
            //         horizontal: 10,
            //         vertical: 10,
            //       ), // add padding
            //     ),
            //     value: selectedCategory,
            //     items: const [
            //       DropdownMenuItem(
            //         value: null,
            //         child: Text('All'),
            //       ),
            //       DropdownMenuItem(
            //         value: 'Chicken',
            //         child: Text('Chicken'),
            //       ),
            //       DropdownMenuItem(
            //         value: 'Egg',
            //         child: Text('Egg'),
            //       ),
            //       DropdownMenuItem(
            //         value: 'Beef',
            //         child: Text('Beef'),
            //       ),
            //       DropdownMenuItem(
            //         value: 'Dessert',
            //         child: Text('Dessert'),
            //       ),
            //       DropdownMenuItem(
            //         value: 'Fish',
            //         child: Text('Fish'),
            //       ),
            //       DropdownMenuItem(
            //         value: 'Rice and alternatives',
            //         child: Text('Rice and alternative'),
            //       ),
            //       DropdownMenuItem(
            //         value: 'Seafood',
            //         child: Text('Seafood'),
            //       ),
            //       DropdownMenuItem(
            //         value: 'Soup',
            //         child: Text('Soup'),
            //       ),
            //       DropdownMenuItem(
            //         value: 'Vegetable',
            //         child: Text('Vegetable'),
            //       ),
            //     ],
            //     onChanged: (value) {
            //       setState(
            //         () {
            //           selectedCategory = value;
            //         },
            //       );
            //     },
            //   ),
            // ]),
            // const SizedBox(
            //   height: 20,
            // ),
            //health option
            // const Text('select health option:'),
            // DropdownButtonFormField<String>(
            //   value: selectedHealth,
            //   items: const [
            //     DropdownMenuItem(
            //       value: 'Standard',
            //       child: Text('Standard'),
            //     ),
            //     DropdownMenuItem(
            //       value: 'Arthritis',
            //       child: Text('Arthritis'),
            //     ),
            //     DropdownMenuItem(
            //       value: 'Weight-reduction',
            //       child: Text('Weight-reduction'),
            //     ),
            //     DropdownMenuItem(
            //       value: 'Diabetic',
            //       child: Text('Diabetic'),
            //     ),
            //     DropdownMenuItem(
            //       value: 'Vegan',
            //       child: Text('Vegan'),
            //     ),
            //   ],
            //   onChanged: (value) {
            //     setState(
            //       () {
            //         selectedHealth = value;
            //       },
            //     );
            //   },
            //   decoration: const InputDecoration(
            //     labelText: 'Select a health option', // set the label text
            //     border: OutlineInputBorder(), // add an outline border
            //     contentPadding: EdgeInsets.symmetric(
            //         horizontal: 10, vertical: 10), // add padding
            //   ),
            // ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        setState(() {
                          // _scrollController.animateTo(0,
                          //     duration: const Duration(milliseconds: 500),
                          //     curve: Curves.ease);
                        });
                      },
                      controller: _ingredientsController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        // suffixIcon: IconButton(
                        //   icon: const Icon(Icons.clear),
                        //   onPressed: () {
                        //     setState(() {
                        //       _ingredientsController.clear();
                        //     });
                        //   },
                        // ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              print(ingredientsList);
                              String newIngredient =
                                  _ingredientsController.text.trim();
                              if (newIngredient.isNotEmpty) {
                                setState(() {
                                  print('Adding ingredient: $newIngredient');
                                  ingredientsList.add(newIngredient);
                                  _ingredientsController.clear();
                                });
                              }
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                        hintText: 'Type your ingredients',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //const Text('Your ingredients: '),
                  Wrap(
                    runAlignment: WrapAlignment.spaceEvenly,
                    clipBehavior: Clip.antiAlias,
                    spacing: 8,
                    children: List<Widget>.generate(
                      ingredientsList.length,
                      (index) {
                        return FilterChip(
                          label: Row(
                            children: [
                              const Icon(Icons.clear, size: 16),
                              const SizedBox(width: 4),
                              Text(ingredientsList[index]),
                            ],
                          ),
                          onSelected: (isSelected) {
                            setState(() {
                              ingredientsList.removeAt(index);
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
            // Row(
            //   children: const [
            //     Text("Selected ingredients: "),
            //   ],
            // ),

            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _dishes
                    .orderBy('name', descending: false)
                    // .where('category', isEqualTo: selectedCategory)
                    .where('keyIngredients', arrayContainsAny: ingredientsList)
                    // .where(
                    //   'diet',
                    //   arrayContains: selectedHealth,
                    // )
                    .snapshots(), //connects to DB //build connection
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData &&
                      streamSnapshot.data!.docs.isNotEmpty) {
                    return Stack(children: [
                      ListView.builder(
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
                                              documentSnapshot:
                                                  documentSnapshot,
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
                      ),
                    ]);
                  }
                  return const Center(
                    child: Text('No cuisine or recipe found'),
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

/**
 * This code assumes that _ingredientsController is a TextEditingController that 
 * holds a comma-separated list of values that you want to search for in the 
 * keyIngredients field. If _ingredientsController is not a TextEditingController, 
 * you can modify the code to use the appropriate variable.

By using whereIn instead of arrayContains, you can pass a list of values 
to search for instead of a single value, which allows you to perform the 
same filtering operation without using multiple array-contains clauses.
 */