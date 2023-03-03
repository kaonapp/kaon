import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FridgePage extends StatefulWidget {
  const FridgePage({super.key});

  @override
  State<FridgePage> createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  // reference for collection/table in db (REQUIRED!)
  final CollectionReference _dishes =
      FirebaseFirestore.instance.collection('dishes');
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fridge',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              // child: Text(
              //   'Coming Soon!',
              //   style: TextStyle(
              //     fontSize: 25,
              //     fontWeight: FontWeight.bold,
              //     fontStyle: FontStyle.italic,
              //   ),
              // ),
              child: Image.asset(
                'assets/comingSoon.png', // Replace with your image path
                width: 500, // Replace with your desired width
                height: 500, // Replace with your desired height
              ),
            ),
          ],
        ),
      ),
    );
  }
}
