// ignore_for_file: sized_box_for_whitespace, prefer_interpolation_to_compose_strings, deprecated_member_use, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  const DetailPage({
    super.key,
    required this.documentSnapshot,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";

    //for listing ingredient in line breaks
    String ingredientList = widget.documentSnapshot['ingredient']
        .map((element) => bullet + '' + element.toString() + '\n\n')
        .join('');

    String procedureList = widget.documentSnapshot['procedure']
        .map((element) => element.toString() + '\n\n')
        .join('');

    String dietList = widget.documentSnapshot['diet']
        .map((element) => element.toString() + '; ')
        .join('');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.documentSnapshot['name'],
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.documentSnapshot['name'],
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                // child: Container(
                //   width: 400.0,
                //   height: 300.0,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10.0),
                //     border: Border.all(
                //       color: Colors.black,
                //       width: 4.0,
                //     ),
                //   ),
                child: Image.network(
                  widget.documentSnapshot['imgUrl'],
                  height: 300,
                  width: 400,
                  //fit: BoxFit.cover,
                ),
              ),
              //),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  widget.documentSnapshot['category'],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    //style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'See more',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch(widget.documentSnapshot['link']);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  'Diet: ' + dietList,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Cook Time: ' +
                    widget.documentSnapshot['cookTime'].toString() +
                    " minutes",
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  widget.documentSnapshot['description'],
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    'Ingredients: ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Text(
                    ingredientList,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    'Procedures: ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    procedureList,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
