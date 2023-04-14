// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class GeneralTutorial extends StatefulWidget {
  const GeneralTutorial({super.key});

  @override
  _GeneralTutorialState createState() => _GeneralTutorialState();
}

class _GeneralTutorialState extends State<GeneralTutorial> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<Widget> _onboardingPages = [
    _buildOnboardingPage(
      'assets/general_tuts/choose.gif',
      'Choose Your Desire Dish',
      'Our app offers a wide variety of dishes to choose from, so you can easily find and pick your favorite meals with just a few taps. ',
    ),
    _buildOnboardingPage(
      'assets/general_tuts/find.gif',
      'Find the Perfect Dish for You!',
      'Our app makes it easy to find the perfect recipe for any occasion. With our advanced search options, you can filter recipes by cuisine, ingredients, cooking time, and more. Say goodbye to endless scrolling and hello to delicious meals!',
    ),
    _buildOnboardingPage(
      'assets/general_tuts/explore.gif',
      'Explore Your Health Options',
      'Our app offers a wide variety of health option to choose from. Whether you are looking for food that is for diabetic, arthritis, weight-reduction,vegan or just standard diet, weve got you covered. ',
    ),
    _buildOnboardingPage(
      'assets/general_tuts/get.gif',
      'Get Started with Our Fridge',
      'Our fridge app helps users keep track of the ingredients they have in their kitchen by allowing them to input them into the app. This makes it easier for users to know what they have available to cook with and can help them plan meals more efficiently.',
    ),
    _buildOnboardingPage(
      'assets/general_tuts/delicious.gif',
      'Explore Delicious Recipes by Category',
      'Our app offers a range of categories for you to choose from when searching for recipes, including chicken, pork, beef, fish, desserts, vegetables, seafood, soups, rice and alternatives, and eggs.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // remove back button
        elevation: 0, // remove shadow
        backgroundColor: Colors.white, // set background color to white
        title: const Text(''), // remove title text
      ),
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(16.0), // set the border radius
              child: PageView(
                controller: _pageController,
                children: _onboardingPages
                    .map((page) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: page,
                        ))
                    .toList(),
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < _onboardingPages.length; i++)
                _buildIndicator(i == _currentPageIndex),
            ],
          ),
          const SizedBox(height: 16.0),
          if (_currentPageIndex != _onboardingPages.length - 1)
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

          // Done button
          if (_currentPageIndex == _onboardingPages.length - 1)
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Done',
                  style: TextStyle(
                    color: Color(0xFFF66B0E),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.deepOrange : Colors.blueGrey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  static Widget _buildOnboardingPage(
      String imagePath, String title, String info) {
    return Material(
      elevation: 0.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.grey, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              // spreadRadius: 1,
              // blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 200.0,
              ),
              const SizedBox(height: 32.0),
              SafeArea(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                alignment: Alignment.center,
                child: Text(
                  info,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
