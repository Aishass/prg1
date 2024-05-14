import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:sahf/OnBoard/onBoardControl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: 'assets/images/onBoardDoc.png',
                title: 'Choose Your Trusted Doctor',
                subtitle:
                    'Find the perfect doctor who meets your needs and cares for your health.',
              ),
              OnBoardingPage(
                image: 'assets/images/appointment.png',
                title: 'Choose Your Trusted Doctor',
                subtitle:
                    ' the perfect doctor who meets your needs and cares for your health.',
              )
            ],
          ),
          const OnBoardSkip(),
          OnboardingDotNavigatio(),
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      bottom: 16,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Color(0xFF4B68FF),
        ),
        child: Icon(
    Icons.arrow_right,
    size: 24, // Example size
    color:  Colors.grey.shade800,// Example color
  ),
      ),
    );
  }
}

class OnboardingDotNavigatio extends StatelessWidget {
  const OnboardingDotNavigatio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: 30,
      left: 16.0,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked:controller.doNavigationClick ,
        count: 2,
        effect: const ExpandingDotsEffect(
          activeDotColor: Color(0xFF4B68FF),
          dotHeight: 6,
        ),
      ),
    );
  }
}

class OnBoardSkip extends StatelessWidget {
  const OnBoardSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.0,
      right: 8.0,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text(
          'Skip',
          style: TextStyle(
            color: Color(0xFF4B68FF),
          ),
        ),
      ),
    );
  }
}



class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image(
              width: MediaQuery.of(Get.context!).size.width * 0.8,
              height: MediaQuery.of(Get.context!).size.height * 0.6,
              image: AssetImage(image)),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
