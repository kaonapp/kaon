import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ui/controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();

  OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          _controller.onboardingPages[index].imageAsset),
                      const SizedBox(height: 32),
                      Text(
                        _controller.onboardingPages[index].title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64.0),
                        child: Text(
                          _controller.onboardingPages[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                  _controller.onboardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? const Color.fromRGBO(246, 107, 14, 1)
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: _controller.forwardAction,
                child: Obx(() {
                  return Text(_controller.isLastPage ? 'Start' : 'Next');
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
