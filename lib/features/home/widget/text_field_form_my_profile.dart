import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/home/widget/lists_text_fields_widgets.dart';

import 'drop_down_my_profile_widget.dart';

class TextFieldFormMyUser extends StatefulWidget {
  const TextFieldFormMyUser(
      {super.key,
      required this.textTitle,
      this.iconTextField,
      required this.hintText});

  final String textTitle;
  final String hintText;
  final Icon? iconTextField;

  @override
  State<TextFieldFormMyUser> createState() => _TextFieldFormMyUserState();
}

class _TextFieldFormMyUserState extends State<TextFieldFormMyUser> {
  String defaultValueState = 'Select option';
  String defaultValueSex = 'Select option';
  String defaultValueGender = 'Select option';
  String defaultValueRace = 'Select option';
  String defaultValueEthnicity = 'Select option';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    ConstLists lists = ConstLists();
    final wColor = ThemesIdx20();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWithBorderWidget(
          suffixIcon: widget.iconTextField,
          borderColor: wColor.mapColors["T100"],
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]),
          hintText: "profile_text_hint_seven",
          textStyle: const TextStyle(fontSize: 18),
          labelText: "profile_text_seven",
          widthBorder: 3,
        ),
        SizedBox(height: height * 0.0250),
        TextFieldWithBorderWidget(
          suffixIcon: widget.iconTextField,
          borderColor: wColor.mapColors["T100"],
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]),
          hintText: "profile_text_hint_eigth",
          textStyle: const TextStyle(fontSize: 18),
          labelText: "profile_text_eight",
          widthBorder: 3,
        ),
        SizedBox(
          height: height * 0.0250,
        ),
        TextFieldWithBorderWidget(
          suffixIcon: widget.iconTextField,
          borderColor: wColor.mapColors["T100"],
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: wColor.mapColors["S600"]),
          hintText: "profile_text_ten",
          textStyle: const TextStyle(fontSize: 18),
          labelText: "profile_text_hint_ten",
          widthBorder: 3,
        ),
        SizedBox(
          height: height * 0.0250,
        ),
        //TODO ADD SPANISH OPTION LISTS
        DropDownWidgetMyProfile(
          item: lists.stateList,
          fieldText: 'profile_text_hint_nine',
          valueState: defaultValueState,
          width: width,
        ),
        SizedBox(
          height: height * 0.0250,
        ),
        DropDownWidgetMyProfile(
          item: lists.sexEnglish,
          fieldText: 'profile_text_hint_eleven',
          valueState: defaultValueSex,
          width: width,
        ),
        SizedBox(height: height * 0.0250),
        DropDownWidgetMyProfile(
          item: lists.genderEnglish,
          fieldText: 'profile_text_hint_twelve',
          valueState: defaultValueGender,
          width: width,
        ),
        SizedBox(
          height: height * 0.025,
        ),
        DropDownWidgetMyProfile(
          item: lists.raceEnglish,
          fieldText: 'profile_text_twelve',
          valueState: defaultValueRace,
          width: width,
        ),
        SizedBox(
          height: height * 0.025,
        ),
        DropDownWidgetMyProfile(
          item: lists.raceEnglish,
          fieldText: 'profile_text_thirdteen',
          valueState: defaultValueEthnicity,
          width: width,
        ),
        SizedBox(
          height: height * 0.0086,
        ),
      ],
    );
  }
}
