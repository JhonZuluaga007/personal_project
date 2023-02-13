import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../common_ui/common_widgets/responsive/dynamic_container_widget.dart';

Future<dynamic> confirmSendInfo({
  required BuildContext context,
  required Icon mainIcon,
  required String titleText,
  required double paddingHeight,
  required String infoText,
  required String? mainButton,
  required VoidCallback mainButtonFunction,
  required String? secondButton,
  required VoidCallback secondButtonFunction,
}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  final color = ThemesIdx20();

  final DynamicContainerWidget dialog = DynamicContainerWidget(
    minWidth: width * 0.05,
    maxWidth: width * 0.05,
    topLeft: const Radius.circular(30),
    topRight: const Radius.circular(30),
    bottomLeft: const Radius.circular(30),
    bottomRight: const Radius.circular(30),
    colorContainer: color.mapColors["P01"],
    children: [
      SizedBox(height: height * 0.018),
      Center(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // border: Border.all(color: wColor.mapColors['Warning']!)
          ),
          child: Center(
            child: mainIcon,
          ),
        ),
      ),
      SizedBox(height: height * 0.018),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.053),
        child: Column(
          children: [
            TextWidget(
              text: titleText,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: color.mapColors['IDBlack'],
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.02),
            TextWidget(
              text: infoText,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: color.mapColors['IDGrey'],
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
      SizedBox(height: height * 0.035),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MainButtonWidget(
            textColor: color.mapColors["P01"],
            buttonString: mainButton ?? ' Gracias ',
            onPressed: mainButtonFunction,
            width: width * 0.35,
          ),
          MainButtonWidget(
            textColor: color.mapColors["P01"],
            buttonString: secondButton ?? ' Gracias ',
            onPressed: secondButtonFunction,
            width: width * 0.35,
            borderColor: color.mapColors['IDGrey'],
            buttonColor: color.mapColors['IDGrey'],
          ),
        ],
      ),
    ],
  );

  return showDialog<Padding>(
    barrierDismissible: false,
    context: context,
    builder: (context) => Material(
      type: MaterialType.transparency,
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06, vertical: paddingHeight),
          child: dialog),
    ),
  );
}
