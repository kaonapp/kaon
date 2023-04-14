// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart'; //route for skip button and done button

class HealthTuts extends StatefulWidget {
  const HealthTuts({super.key});

  @override
  _HealthTutsState createState() => _HealthTutsState();
}

class _HealthTutsState extends State<HealthTuts> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<Widget> _onboardingPages = [
    _buildOnboardingPage(
      'assets/health_tuts/explore.gif',
      'Explore Your Health Options',
      'Our app offers a wide variety of health option to choose from. Whether you are looking for food that is for diabetic, arthritis, weight-reduction,vegan or just standard diet, weve got you covered. ',
    ),
    _buildOnboardingPage(
      'assets/health_tuts/standard.gif',
      'Learn About Our Standard Diet Plan for a Healthier You',
      'Discover Our Standard Diet Plan for a Balanced and Nutritious Eating Habit. Our Program is Tailored to Meet Your Health Goals and Backed by Registered Dietitians and Health Professionals.',
    ),
    _buildOnboardingPage(
      'assets/health_tuts/diabetic.gif',
      'Managing Diabetes with Our Balanced Diabetic Diet Plan',
      'If you have diabetes, we offer specialized Diabetic Diets that are designed to help you manage your blood sugar levels and improve your overall health. Our Diabetic Diets focus on avoiding dishes with high sugar content, and our experienced dietitians will work with you to create a personalized plan that meets your unique nutritional needs.',
    ),
    _buildOnboardingPage(
      'assets/health_tuts/arthritis.gif',
      'Managing Arthritis with a Comprehensive and Evidence-Based Approach.',
      'We offer specialized Arthritis Diets that can help reduce inflammation and manage your symptoms. Our Arthritis Diets focus on avoiding seafood and dishes that use beef as their main ingredient. We also highly recommend avoiding fatty and oily foods as they can trigger inflammation in the body.',
    ),
    _buildOnboardingPage(
      'assets/health_tuts/weight.gif',
      'Your Pathway to Successful Weight Reduction with Tailored Programs and Expert Support',
      'Looking to lose weight? Our Weight Reduction Diets are designed to help you achieve your weight loss goals by providing less fatty dishes that are still delicious and satisfying. Our program is based on the latest research and guidelines in weight management',
    ),
    _buildOnboardingPage(
      'assets/health_tuts/vegan.gif',
      'Nourishing Your Body and Mind with a Vegan Diet',
      ' Achieve a Healthier and More Sustainable Lifestyle with Our Vegan Programs Tailored to Meet Your Needs. Our Experienced Dietitians will Help You Create a Personalized Plan that Avoids Red Meat, Chicken, Fish, Eggs, and Dairy Products.',
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
        child: SingleChildScrollView(
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
                const SizedBox(height: 25.0),
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
      ),
    );
  }
}
