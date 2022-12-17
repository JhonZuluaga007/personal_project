import 'package:flutter/material.dart';

class MainBannerDescriptionOnboarding extends StatelessWidget {
  final String imageMainBanner;

  const MainBannerDescriptionOnboarding(
      {super.key, required this.imageMainBanner});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.94,
      height: height * 0.12,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset(
        imageMainBanner,
        fit: BoxFit.cover,
      ).image)),
    );
  }
}
