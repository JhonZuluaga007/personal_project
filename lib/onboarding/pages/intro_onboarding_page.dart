import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';
import '../../onboarding/widgets/onboarding_description.dart';
import '../../common_ui/common_pages/my_app_scaffold_page.dart';

class IntroOnboardingPage extends StatefulWidget {
  const IntroOnboardingPage({super.key});

  @override
  State<IntroOnboardingPage> createState() => _IntroOnboardingPageState();
}

class _IntroOnboardingPageState extends State<IntroOnboardingPage> {
  late final PageController _pageController;
  int pageNumber = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return MyAppScaffold(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.03, top: height * 0.001),
          child: FloatingActionButton(
              elevation: 0,
              backgroundColor: wColor.mapColors["S800"],
              child: Icon(
                Icons.arrow_back,
                color: wColor.mapColors["IDWhite"],
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        SizedBox(
          height: height * 0.100,
        ),
        SizedBox(
          height: height * 0.68,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              pageNumber = value;
              setState(() {});
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  return child!;
                },
                child: Column(
                  children: [
                    onboardingDescription(pageNumber),
                  ],
                ),
              );
            },
            itemCount: 2,
          ),
        ),
      ],
    );
  }

  Widget onboardingDescription(int pageNumber) {
    switch (pageNumber) {
      case 0:
        return OnboardingDescription(
          tOnboarding: "onboarding_one",
          imageOnboarding: "assets/images/onboarding_1.png",
          titleOnboarding: "onboarding_number_1",
          descriptionOnboarding: "onboarding_description_1",
          onPressed: () {},
          numberOnboarding: "onboarding_description",
          pageNumber: pageNumber,
          textButton: "text_button_onboarding",
        );
      case 1:
        return OnboardingDescription(
          tOnboarding: "onboarding_one",
          imageOnboarding: "assets/images/onboarding_2.png",
          titleOnboarding: "onboarding_number_2",
          descriptionOnboarding: "onboarding_description_2",
          onPressed: () {},
          numberOnboarding: "onboarding_description",
          pageNumber: pageNumber,
          textButton: "text_button_onboarding",
        );
      default:
        return OnboardingDescription(
          tOnboarding: "onboarding_one",
          imageOnboarding: "assets/images/onboarding_1.png",
          titleOnboarding: "onboarding_number",
          descriptionOnboarding: "onboarding_description",
          onPressed: () {},
          numberOnboarding: "onboarding_description",
          pageNumber: pageNumber,
          textButton: "text_button_onboarding",
        );
    }
  }
}
