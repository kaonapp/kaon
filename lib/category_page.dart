import 'package:flutter/material.dart';

import 'categoryPage/beef_page.dart';
import 'categoryPage/chicken_page.dart';
import 'categoryPage/dessert_page.dart';
import 'categoryPage/egg_page.dart';
import 'categoryPage/fish_page.dart';
import 'categoryPage/pork_page.dart';
import 'categoryPage/rice_page.dart';
import 'categoryPage/sea_foodpage.dart';
import 'categoryPage/soup_page.dart';
import 'categoryPage/vegetable_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Category',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 10,
        ),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Wrap(
              spacing: 9.0, // gap between adjacent containers
              runSpacing: 15.0, // gap between rows
              children: [
                //chicken
                Container(
                  height: 100,
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
                //pork
                Container(
                  height: 100,
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
                        'assets/pork.jpg',
                      ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.4), BlendMode.dstATop),
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
                //beef
                Container(
                  height: 100,
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
                        'assets/beef.jpg',
                      ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.4), BlendMode.dstATop),
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
                //Vegetable
                Container(
                  height: 100,
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
                        'assets/vegetable.jpg',
                      ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.4), BlendMode.dstATop),
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
                //egg
                Container(
                  height: 100,
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
                        'assets/egg.jpg',
                      ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.4), BlendMode.dstATop),
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
                //Soup
                Container(
                  height: 100,
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
                        'assets/soup.jpg',
                      ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.4), BlendMode.dstATop),
                    ),
                  ),
                  width: 160.0,
                  // color: Colors.red,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SoupPage(),
                        ),
                      );
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
                //rice
                Container(
                  height: 100,
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
                        'assets/rice.jpg',
                      ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.4), BlendMode.dstATop),
                    ),
                  ),
                  width: 160.0,
                  // color: Colors.red,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RicePage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Rice and alt.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                //Seafood
                Container(
                  height: 100,
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
                        'assets/seafood.jpg',
                      ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.4), BlendMode.dstATop),
                    ),
                  ),
                  width: 160.0,
                  // color: Colors.red,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SeafoodPage(),
                        ),
                      );
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
                //Dessert
                Container(
                  height: 100,
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
                        'assets/dessert.jpg',
                      ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.4), BlendMode.dstATop),
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
                //Fish
                Container(
                  height: 100,
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
                        'assets/fish.jpg',
                      ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.4), BlendMode.dstATop),
                    ),
                  ),
                  width: 160.0,
                  // color: Colors.red,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FishPage(),
                        ),
                      );
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
