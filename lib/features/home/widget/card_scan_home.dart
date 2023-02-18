import 'package:flutter/material.dart';

import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/icons/icons.dart';

import '../../../config/theme/theme.dart';

class CardScanHome extends StatelessWidget {
  final String textTitle;
  final String textDescription;
  final String imageIcon;
  final void Function()? onTap;

  const CardScanHome({
    super.key,
    required this.textTitle,
    required this.textDescription,
    required this.imageIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.017),
        child: Card(
          shadowColor: wColor.mapColors["IDWhite"],
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.037),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.039),
                child: Image.asset(imageIcon),
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.044,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: textTitle,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.02,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: height * 0.0043,
                      ),
                      TextWidget(
                        text: textDescription,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.02,
                            color: wColor.mapColors["S600"]),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: width * 0.16,
              ),
              Image.asset(IconsFolderCovid.arrowCircleRight)
            ]),
          ),
        ),
      ),
    );
  }
}
