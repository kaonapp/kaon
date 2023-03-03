// ignore_for_file: sized_box_for_whitespace, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui/categoryPage/dessertpage.dart';
import 'package:ui/categoryPage/eggpage.dart';
import 'package:ui/categoryPage/porkpage.dart';
import 'package:ui/categoryPage/souppage.dart';
import 'package:ui/categoryPage/vegetablepage.dart';
import 'package:ui/categorypage.dart';
import 'package:ui/detailpage.dart';
import 'package:ui/searchpage.dart';

import 'categoryPage/beefpage.dart';
import 'categoryPage/chickenpage.dart';
import 'dietPage/arthritispage.dart';
import 'dietPage/diabeticpage.dart';
import 'dietPage/standardpage.dart';
import 'dietPage/veganpage.dart';
import 'dietPage/weightpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference for collection/table in db (REQUIRED!)
  final CollectionReference _dishes =
      FirebaseFirestore.instance.collection('dishes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kaon!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.filter_alt),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,
            bottom: 15,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Expanded(
                    child: Column(),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryPage(),
                          ),
                        );
                      },
                      child: const Text('view all >'))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              //input stream builder categories in listview below
              Container(
                width: double.infinity,
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    //Chicken
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                        image: DecorationImage(
                          image: const AssetImage(
                            'assets/Chicken.jpg',
                          ),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(0.3), BlendMode.dstATop),
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChickenPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Chicken',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 15,
                    ),
                    //pork container
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: const AssetImage(
                            'assets/pork.jpg',
                          ),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(0.3), BlendMode.dstATop),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PorkPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Pork',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    //vegetable container
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: const AssetImage(
                            'assets/vegetable.jpg',
                          ),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VegetablePage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Vegetable',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    //dessert container
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: const AssetImage(
                            'assets/dessert.jpg',
                          ),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DessertPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Dessert',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    //egg container
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: const AssetImage(
                            'assets/egg.jpg',
                          ),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EggPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Egg',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    //beef container
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: const AssetImage(
                            'assets/beef.jpg',
                          ),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BeefPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Beef',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //browse by diet
              Row(
                children: [
                  const Text(
                    'Browse by diet',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Expanded(
                    child: Column(),
                  ),
                  //TextButton(onPressed: () {}, child: const Text('view all >'))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    //Standard diet
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StandardPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Standard',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 15,
                    ),
                    //Diabetic container
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DiabeticPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Diabetic',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    //Arthritis container
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ArthritisPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Arthritis',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    //Weight-reduction container
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WeightPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Weight-reduction',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    //Vegan container
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VeganPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Vegan',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //Dessert
              Row(
                children: [
                  const Text(
                    'Dessert',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Expanded(
                    child: Column(),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DessertPage(),
                          ),
                        );
                      },
                      child: const Text('view all >'))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 100.0,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _dishes
                      .orderBy('name', descending: false)
                      .where('category', isEqualTo: "Dessert")
                      .snapshots(), //connects to DB //build connection
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];

                          return //Dessert diet
                              Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  documentSnapshot['imgUrl'],
                                ),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.grey.withOpacity(0.4),
                                    BlendMode.dstATop),
                              ),
                            ),
                            width: 160.0,
                            // color: Colors.red,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      documentSnapshot: documentSnapshot,
                                    ),
                                  ),
                                );
                              },
                              child: Center(
                                child: Text(
                                  documentSnapshot['name'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
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
              const SizedBox(
                height: 15,
              ),
              //Vegetable Row
              Row(
                children: [
                  const Text(
                    'Vegetable',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Expanded(
                    child: Column(),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VegetablePage(),
                          ),
                        );
                      },
                      child: const Text('view all >'))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              //Vegetable Select
              Container(
                width: double.infinity,
                height: 100.0,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _dishes
                      .orderBy('name', descending: false)
                      .where('category', isEqualTo: "Vegetable")
                      .limit(6)
                      .snapshots(), //connects to DB //build connection
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];

                          return //vegetable diet
                              Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  documentSnapshot['imgUrl'],
                                ),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.grey.withOpacity(0.5),
                                    BlendMode.dstATop),
                              ),
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            width: 160.0,
                            // color: Colors.red,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      documentSnapshot: documentSnapshot,
                                    ),
                                  ),
                                );
                              },
                              child: Center(
                                child: Text(
                                  documentSnapshot['name'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
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
      ),
    );
  }
}
