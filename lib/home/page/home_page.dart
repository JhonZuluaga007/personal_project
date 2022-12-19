import 'package:flutter/material.dart';

import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/home/widget/card_scan_home.dart';
import 'package:personal_project/home/widget/main_banner_description_onboarding.dart';
import 'package:personal_project/icons/icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      appBar: AppBar(
        backgroundColor: wColor.mapColors["IDWhite"],
        actions: [
          Image.asset("assets/icons/idx_Icon.png"),
          SizedBox(
            width: width * 0.30,
          ),
        ],
      ),
      children: [
        SizedBox(height: height * 0.018),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.018),
          child: TextWidget(
            text: "home_name_user",
            style: TextStyle(
                letterSpacing: -0.02,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: wColor.mapColors["S800"]),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: TextWidget(
            text: "home_description",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: wColor.mapColors["S500"]),
          ),
        ),
        SizedBox(height: height * 0.031),
        Center(
          child: SizedBox(
            height: height * 0.14,
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
                  child: onboardingDescription(pageNumber),
                );
              },
              itemCount: 3,
            ),
          ),
        ),
        SizedBox(height: height * 0.021),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.010),
                child: Icon(
                  Icons.circle,
                  size: 12,
                  color: pageNumber == index
                      ? wColor.mapColors['T400']
                      : wColor.mapColors['T100'],
                )
              ),
              
            ),
          ),
        ),
        SizedBox(height: height * 0.039),
        Padding(
          padding: EdgeInsets.only(left: width * 0.03, top: height * 0.018),
          child: TextWidget(
            text: "home_title_card",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: wColor.mapColors["S800"]),
          ),
        ),
        SizedBox(height: height * 0.02),
        const CardScanHome(
          imageIcon: IconsFolderCovid.scanKitLabel, 
          textDescription: "home_description_card_scan", 
          textTitle: "home_title_card_scan",
        ),
        SizedBox(height: height * 0.021),
        const CardScanHome(
          imageIcon: IconsFolderCovid.covid19Self, 
          textDescription: "home_description_card_scan", 
          textTitle: "home_title_card_covid_19",
        ),
        SizedBox(height: height * 0.021),
        const CardScanHome(
          imageIcon: IconsFolderCovid.testStatusResult, 
          textDescription: "home_description_card_scan", 
          textTitle: "home_title_card_test_status",
        ),
      ],
    );
  }
}

Widget onboardingDescription(int pageNumber) {
  switch (pageNumber) {
    case 0:
      return const MainBannerDescriptionOnboarding(
        imageMainBanner: 'assets/images/home_principal_banner.png',
      );
    case 1:
      return const MainBannerDescriptionOnboarding(
        imageMainBanner: 'assets/images/home_principal_banner.png',
      );
    case 2:
      return const MainBannerDescriptionOnboarding(
        imageMainBanner: 'assets/images/home_principal_banner.png',
      );
    default:
      return const MainBannerDescriptionOnboarding(
        imageMainBanner: 'assets/images/home_principal_banner.png',
      );
  }
}
