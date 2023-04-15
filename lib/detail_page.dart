// ignore_for_file: sized_box_for_whitespace, prefer_interpolation_to_compose_strings, deprecated_member_use, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
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
  //youtube controller - Using Youtube Player
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();

    String url = widget.documentSnapshot['vidLink'];
    String? vidUrl = YoutubePlayer.convertUrlToId(url);
    controller = YoutubePlayerController(
      initialVideoId: vidUrl.toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //for listing ingredient in line breaks
    String ingredientList = widget.documentSnapshot['ingredient']
        .map((element) => element.toString() + '\n\n')
        .join('');

    String procedureList = widget.documentSnapshot['procedure']
        .map((element) => element.toString() + '\n\n')
        .join('');

    // String dietList = widget.documentSnapshot['diet']
    //     .map((element) => element.toString() + '; ')
    //     .join('');

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          // title: Text(
          //   widget.documentSnapshot['name'],
          //   style: const TextStyle(
          //     fontSize: 25,
          //     fontWeight: FontWeight.bold,
          //     fontStyle: FontStyle.normal,
          //   ),
          // ),
          // actions: const [],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      widget.documentSnapshot['imgUrl'],
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          widget.documentSnapshot['name'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Display category
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          children: [
                            const TextSpan(
                              text: 'Category: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.documentSnapshot['category']}',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Display Health Option
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          children: [
                            const TextSpan(
                              text: 'Health Option: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '${widget.documentSnapshot['diet'].join(', ')}',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Display cooking time
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          children: [
                            const TextSpan(
                              text: 'Cooking Time: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '${widget.documentSnapshot['cookTime']} minutes',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      //decription field
                      Text(
                        widget.documentSnapshot['description'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      //ingredient field

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpansionTile(
                            title: const Text(
                              'Ingredients',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                            tilePadding: EdgeInsets.zero,
                            initiallyExpanded: true,
                            children: [
                              ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(left: 20.0),
                                shrinkWrap: true,
                                children: [
                                  Text(ingredientList),
                                ],
                              ),
                            ],
                          ),
                          //procedure field
                          const Text(
                            'Procedure:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                          const SizedBox(height: 8),

                          //video procedure container
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: double.infinity,
                            color: Colors.grey[300],
                            child: Center(
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [player],
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),
                          // procedure field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                procedureList,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ],
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
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
