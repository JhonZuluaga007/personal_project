import 'package:Tellme/common_ui/common_widgets/responsive/dynamic_container_widget.dart';
import 'package:flutter/material.dart';

import '../../../icons/icons.dart';
import '../../../config/theme/theme.dart';
import '../../../common_ui/common_widgets/text/text_widget.dart';

class CardScanHome extends StatelessWidget {
  final String textTitle;
  final String? textDescription;
  final String imageIcon;
  final void Function()? onTap;

  const CardScanHome({
    super.key,
    required this.textTitle,
    this.textDescription,
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
        child: DynamicContainerWidget(
          children: [
            Card(
              shadowColor: wColor.mapColors["IDWhite"],
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.037),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                          SizedBox(
                            width: width * 0.45,
                            child: TextWidget(
                              text: textTitle,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.02,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.0043,
                          ),
                          TextWidget(
                            text: textDescription ?? '',
                            requiresTranslate: false,
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
                    width: width * 0.08,
                  ),
                  Image.asset(IconsFolderCovid.arrowCircleRight)
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
