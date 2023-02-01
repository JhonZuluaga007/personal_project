



import 'package:flutter/material.dart';

import '../../../../../common_ui/common_widgets/buttons/button_widget.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../config/theme/theme.dart';

Future buildPopUpImage(BuildContext context, Function() onTapOne, Function() onTapTwo) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final wColor = ThemesIdx20();

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: TextWidget(
            text: "my_user_pop_up_image",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: wColor.mapColors["S800"]
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.036, vertical: height * 0.020),
              child: Column(
                children: [

                  ButtonWidget(
                    width: width * 0.920,
                    height: height * 0.053,
                    borderRadiusButton: 30,
                    icon: Icons.file_upload_outlined,
                    iconColor: wColor.mapColors["S800"],
                    buttonString: "my_user_button_text_00",
                    textColor: wColor.mapColors["S800"],
                    buttonColor: wColor.mapColors["P01"],
                    borderColor: wColor.mapColors["S800"],
                    onPressed: onTapOne
                  ),
                  SizedBox(height: height * 0.021),
                  ButtonWidget(
                    width: width * 0.920,
                    height: height * 0.053,
                    borderRadiusButton: 30,
                    icon: Icons.camera_alt_outlined,
                    iconColor: wColor.mapColors["S800"],
                    buttonString: "my_user_button_text_01",
                    textColor: wColor.mapColors["S800"],
                    buttonColor: wColor.mapColors["P01"],
                    borderColor: wColor.mapColors["S800"],
                    onPressed: onTapTwo
                  ),
                ],
              ),
            ),
          ]
        );
      }
    );
  }