import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/config/theme/theme.dart';

class TextFieldFormMyUser extends StatelessWidget {
  const TextFieldFormMyUser(
      {super.key,
      required this.textTitle,
      this.iconTextField,
      required this.hintText});

  final String textTitle;
  final String hintText;
  final Icon? iconTextField;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWithBorderWidget(
          suffixIcon: iconTextField,
          borderColor: wColor.mapColors["T100"],
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]),
          hintText: "profile_text_hint_seven",
          textStyle: const TextStyle(fontSize: 18),
          labelText: "profile_text_seven",
        ),
        SizedBox(height: height * 0.0250),
        TextFieldWithBorderWidget(
          suffixIcon: iconTextField,
          borderColor: wColor.mapColors["T100"],
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]),
          hintText: "profile_text_hint_eigth",
          textStyle: const TextStyle(fontSize: 18),
          labelText: "profile_text_eight",
        ),
        SizedBox(
          height: height * 0.0250,
        ),
        TextFieldWithBorderWidget(
          suffixIcon: iconTextField,
          borderColor: wColor.mapColors["T100"],
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]),
          hintText: "profile_text_hint_nine",
          textStyle: const TextStyle(fontSize: 18),
          labelText: "profile_text_nine",
        ),
        SizedBox(height: height * 0.0250),
        TextFieldWithBorderWidget(
          suffixIcon: iconTextField,
          borderColor: wColor.mapColors["T100"],
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]),
          hintText: "profile_text_hint_ten",
          textStyle: const TextStyle(fontSize: 18),
          labelText: "profile_text_ten",
        ),
        SizedBox(
          height: height * 0.025,
        ),
        TextFieldWithBorderWidget(
          suffixIcon: iconTextField,
          borderColor: wColor.mapColors["T100"],
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]),
          hintText: "profile_text_eleven",
          textStyle: const TextStyle(fontSize: 18),
          labelText: "profile_text_hint_eleven",
        ),
        SizedBox(
          height: height * 0.025,
        ),
        TextFieldWithBorderWidget(
          suffixIcon: iconTextField,
          borderColor: wColor.mapColors["T100"],
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]),
          hintText: "profile_text_hint_eleven",
          textStyle: const TextStyle(fontSize: 18),
          labelText: "profile_text_hint_twelve",
        ),
        SizedBox(height: height * 0.025),
        TextFieldWithBorderWidget(
          suffixIcon: iconTextField,
          borderColor: wColor.mapColors["T100"],
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]),
          hintText: "helper_one", // TODO CHECK
          textStyle: const TextStyle(fontSize: 18),
          labelText: "profile_text_twelve",
        ),
        SizedBox(
          height: height * 0.025,
        ),
        TextFieldWithBorderWidget(
          suffixIcon: iconTextField,
          borderColor: wColor.mapColors["T100"],
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]),
          hintText: "helper_two", // TODO CHECK
          textStyle: const TextStyle(fontSize: 18),
          labelText: "profile_text_thirdteen",
        ),
        SizedBox(
          height: height * 0.0086,
        ),
      ],
    );
  }
}
