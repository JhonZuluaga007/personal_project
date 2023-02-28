import 'package:flutter/material.dart';
import 'package:Tellme/common_ui/common_widgets/buttons/button_widget.dart';
import 'package:Tellme/common_ui/common_widgets/text/text_widget.dart';
import 'package:Tellme/config/theme/theme.dart';

class OnboardingDescription extends StatelessWidget {
  final String tOnboarding;
  final String numberOnboarding;
  final String imageOnboarding;
  final String titleOnboarding;
  final String descriptionOnboarding;
  final String textButton;
  final Function onPressed;
  final int pageNumber;

  const OnboardingDescription({
    super.key,
    required this.tOnboarding,
    required this.imageOnboarding,
    required this.titleOnboarding,
    required this.descriptionOnboarding,
    required this.onPressed,
    required this.numberOnboarding,
    required this.pageNumber,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Row(
            children: [
              TextWidget(
                text: tOnboarding,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.w500,
                  color: wColor.mapColors["S600"],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Image.asset(imageOnboarding),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: width * 0.03),
          child: TextWidget(
            text: titleOnboarding,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 20,
              letterSpacing: -0.2,
              fontWeight: FontWeight.w600,
              color: wColor.mapColors["S800"],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: TextWidget(
            text: descriptionOnboarding,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.04,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: ButtonWidget(
              buttonString: textButton,
              textStyle: TextStyle(color: wColor.mapColors["IDWhite"]),
              buttonColor: wColor.mapColors["500BASE"],
              borderColor: wColor.mapColors["500BASE"],
              onPressed: () {}),
        ),
        SizedBox(
          height: height * 0.05,
        )
      ],
    );
  }
}
