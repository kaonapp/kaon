import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'categorypage.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
            bottom: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Choose a Category',
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
                    child: const Text('required'),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const ChickenPage(),
                          //   ),
                          // );
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const PorkPage(),
                          //   ),
                          // );
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const VegetablePage(),
                          //   ),
                          // );
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const DessertPage(),
                          //   ),
                          // );
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const EggPage(),
                          //   ),
                          // );
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const BeefPage(),
                          //   ),
                          // );
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
                    const SizedBox(
                      width: 15,
                    ),
                    //fish container
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
                            'assets/fish.jpg',
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const BeefPage(),
                          //   ),
                          // );
                        },
                        child: const Text(
                          'Fish',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    //rice
                    const SizedBox(
                      width: 15,
                    ),
                    //rice container
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
                            'assets/rice.jpg',
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const BeefPage(),
                          //   ),
                          // );
                        },
                        child: const Text(
                          'Rice',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    //soup
                    const SizedBox(
                      width: 15,
                    ),
                    //soup container
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
                            'assets/soup.jpg',
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const BeefPage(),
                          //   ),
                          // );
                        },
                        child: const Text(
                          'Soup',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    //seafood
                    const SizedBox(
                      width: 15,
                    ),
                    //seafood container
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
                            'assets/seafood.jpg',
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const BeefPage(),
                          //   ),
                          // );
                        },
                        child: const Text(
                          'Seafood',
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
              // Select diet row
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    'Select Diet Option',
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
                    child: const Text('optional'),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // Select Diet option row
              SizedBox(
                width: double.infinity,
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    //Standard
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
                        // image: DecorationImage(
                        //   image: const AssetImage(
                        //     'assets/Chicken.jpg',
                        //   ),
                        //   fit: BoxFit.fill,
                        //   colorFilter: ColorFilter.mode(
                        //       Colors.grey.withOpacity(0.3), BlendMode.dstATop),
                        // ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const ChickenPage(),
                          //   ),
                          // );
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
                        // image: DecorationImage(
                        //   image: const AssetImage(
                        //     'assets/pork.jpg',
                        //   ),
                        //   fit: BoxFit.fill,
                        //   colorFilter: ColorFilter.mode(
                        //       Colors.grey.withOpacity(0.3), BlendMode.dstATop),
                        // ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const PorkPage(),
                          //   ),
                          // );
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
                        // image: DecorationImage(
                        //   image: const AssetImage(
                        //     'assets/vegetable.jpg',
                        //   ),
                        //   fit: BoxFit.fill,
                        //   colorFilter: ColorFilter.mode(
                        //       Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                        // ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const VegetablePage(),
                          //   ),
                          // );
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
                        // image: DecorationImage(
                        //   image: const AssetImage(
                        //     'assets/dessert.jpg',
                        //   ),
                        //   fit: BoxFit.fill,
                        //   colorFilter: ColorFilter.mode(
                        //       Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                        // ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const DessertPage(),
                          //   ),
                          // );
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
                        // image: DecorationImage(
                        //   image: const AssetImage(
                        //     'assets/egg.jpg',
                        //   ),
                        //   fit: BoxFit.fill,
                        //   colorFilter: ColorFilter.mode(
                        //       Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                        // ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 160.0,
                      // color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const EggPage(),
                          //   ),
                          // );
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
              // Select Ingredients Row
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    'Other Ingredients',
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
                    child: const Text('optional'),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              TextField(
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value) {
                  setState(() {});
                },
                controller: null,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: "Type ingredient name",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // Find recipe button
              ElevatedButton(
                onPressed: (() {}),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                ),
                child: const Text(
                  'Find Recipe >',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
            ], // MAIN CHILDREN of COLUMN
          ), // MAIN COLUMN (BODY)
        ),
      ), // MAIN CONTAINER (BODY)
    );
  }
}
