import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<Widget> _onboardingPages = [
    _buildOnboardingPage(
      'Welcome to My App!',
      'assets/onboarding.png',
    ),
    _buildOnboardingPage(
      'Discover new features',
      'assets/onboarding.png',
    ),
    _buildOnboardingPage(
      'Get started!',
      'assets/onboarding.png',
    ),
    _buildOnboardingPage(
      'Page 4',
      'assets/onboarding.png',
    ),
    _buildOnboardingPage(
      'Page 5',
      'assets/onboarding.png',
    ),
    _buildOnboardingPage(
      'Page 6',
      'assets/onboarding.png',
    ),
    _buildOnboardingPage(
      'Page 7',
      'assets/onboarding.png',
    ),
    _buildOnboardingPage(
      'Page 8',
      'assets/onboarding.png',
    ),
    _buildOnboardingPage(
      'Page 9',
      'assets/onboarding.png',
    ),
    _buildOnboardingPage(
      'Page 10',
      'assets/onboarding.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _onboardingPages,
              onPageChanged: (int index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text('Next'),
                ),
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(_onboardingPages.length - 1);
                  },
                  child: const Text('Skip'),
                ),
              ],
            ),
          if (_currentPageIndex == _onboardingPages.length - 1)
            ElevatedButton(
              onPressed: () {
                // Navigate to the main app
              },
              child: const Text('Done'),
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
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  static Widget _buildOnboardingPage(String title, String imagePath) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 500.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
