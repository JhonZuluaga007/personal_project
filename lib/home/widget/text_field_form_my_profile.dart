import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/config/theme/theme.dart';

class TextFieldFormMyUser extends StatelessWidget {

  const TextFieldFormMyUser({
    super.key, 
    required this.textTitle, 
    required this.labelText, 
    this.iconTextField, 
    required this.hintText
  });

  final String textTitle;
  final String labelText;
  final String hintText;
  final Icon? iconTextField;

  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final wColor = ThemesIdx20();

  return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.037),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: textTitle, 
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: wColor.mapColors["S700"]
            ),
          ),
          SizedBox(
            height: height * 0.0086,
          ),
          TextFieldWithBorderWidget(
            labelText: labelText,
            suffixIcon: iconTextField,
            borderColor: wColor.mapColors["T100"],
            hintStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]
            ), 
            hintText: hintText,
          ),
          SizedBox(height: height * 0.050),
          TextWidget(
            text: textTitle, 
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: wColor.mapColors["S700"]
            ),
          ),
          SizedBox(
            height: height * 0.0086,
          ),
          TextFieldWithBorderWidget(
            labelText: labelText,
            hintText: hintText,
            borderColor: wColor.mapColors["T100"],
            hintStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]
            ), 
          ),
          SizedBox(height: height * 0.050),
          TextWidget(
            text: textTitle, 
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: wColor.mapColors["S700"]
            ),
          ),
          SizedBox(
            height: height * 0.0086,
          ),
          TextFieldWithBorderWidget(
            labelText: labelText,
            hintText: hintText,
            borderColor: wColor.mapColors["T100"],
            hintStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]
            ),
          ),
          SizedBox(height: height * 0.050),
          TextWidget(
            text: textTitle, 
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: wColor.mapColors["S700"]
            ),
          ),
          SizedBox(
            height: height * 0.0086,
          ),
          TextFieldWithBorderWidget(
            labelText: labelText,
            hintText: hintText,
            suffixIcon: iconTextField,
            borderColor: wColor.mapColors["T100"],
            hintStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]
            ),
          ),
          SizedBox(height: height * 0.050),
          TextWidget(
            text: textTitle, 
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: wColor.mapColors["S700"]
            ),
          ),
          SizedBox(
            height: height * 0.0086,
          ),
          TextFieldWithBorderWidget(
            labelText: labelText,
            hintText: hintText,
            borderColor: wColor.mapColors["T100"],
            hintStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]
            ), 
          ),
          SizedBox(height: height * 0.050),
          TextWidget(
            text: textTitle, 
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: wColor.mapColors["S700"]
            ),
          ),
          SizedBox(
            height: height * 0.0086,
          ),
          TextFieldWithBorderWidget(
            labelText: labelText,
            hintText: hintText,
            suffixIcon: iconTextField,
            borderColor: wColor.mapColors["T100"],
            hintStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]
            ), 
          ),
        ],
      ),
    );
  }
}
