import 'package:flutter/cupertino.dart';
import 'package:ui/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/researching.png', 'Food Research',
        'Our app is designed to help you discover the latest food research and learn about the best foods for your health.'),
    OnboardingInfo('assets/diet.png', 'Diet Options',
        'Designed to help you discover a variety of diet options and make informed choices about your diet and lifestyle.'),
    OnboardingInfo('assets/grocery.png', 'Filtering',
        'You can easily search and filter through our extensive database of recipes to find the perfect meal for your needs.')
  ];
}
