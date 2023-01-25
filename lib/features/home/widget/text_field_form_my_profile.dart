import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_no_label_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/home/page/covid_19_test/ui/widgets/drop_down_questions_widget.dart';
import 'package:personal_project/features/home/widget/lists_text_fields_widgets.dart';

import '../../auth/bloc/auth_bloc.dart';
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
  final List<String> genderAnswer = [
    "gender_answer_one",
    "gender_answer_two",
    "gender_answer_three",
    "gender_answer_four",
    "gender_answer_five",
    "gender_answer_six",
    "gender_answer_seven",
  ];
  final List<String> sexAnswer = [
    "sex_answer_one",
    "sex_answer_two",
  ];
  final List<String> raceAnswer = [
    "race_answer_one",
    "race_answer_two",
    "race_answer_three",
    "race_answer_four",
    "race_answer_five",
    "race_answer_six",
    "race_answer_seven",
  ];
  final List<String> ethnicityAnswer = [
    "ethnicity_answer_one",
    "ethnicity_answer_two"
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    ConstLists lists = ConstLists();
    final wColor = ThemesIdx20();
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWithBorderWidget(
              suffixIcon: widget.iconTextField,
              borderColor: wColor.mapColors["T100"],
              requiresTranslate: false,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: wColor.mapColors["S600"]),
              hintText: state.address ?? "profile_text_hint_seven",
              textStyle: const TextStyle(fontSize: 18),
              labelText: "profile_text_seven",
              widthBorder: 3,
            ),
            SizedBox(height: height * 0.0250),
            TextFieldWithBorderWidget(
              suffixIcon: widget.iconTextField,
              borderColor: wColor.mapColors["T100"],
              requiresTranslate: false,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: wColor.mapColors["S600"]),
              hintText: state.city ?? "profile_text_eigth",
              textStyle: const TextStyle(fontSize: 18),
              labelText: "profile_text_hint_eigth",
              widthBorder: 3,
            ),
            SizedBox(
              height: height * 0.0250,
            ),
            TextFieldWithBorderWidget(
              suffixIcon: widget.iconTextField,
              requiresTranslate: false,
              borderColor: wColor.mapColors["T100"],
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: wColor.mapColors["S600"]),
              hintText: state.zip ?? "050001",
              textStyle: const TextStyle(fontSize: 18),
              labelText: "profile_text_hint_ten",
              widthBorder: 3,
            ),
            SizedBox(
              height: height * 0.0250,
            ),
            DropDownWidgetMyProfile(
              item: lists.stateList,
              fieldText: 'profile_text_hint_nine',
              valueState: state.state ?? defaultValueState,
              width: width,
            ),
            SizedBox(
              height: height * 0.0250,
            ),
            DropDownQuestionsWidget(
                dropDownItem: sexAnswer,
                textQuestion: "sex_question",
                width: width,
                dropDownValue: state.sex ?? 'Select option'),
            SizedBox(
              height: height * 0.0250,
            ),
            DropDownQuestionsWidget(
                dropDownItem: genderAnswer,
                textQuestion: "gender_answer_question",
                width: width,
                dropDownValue: state.gender ?? 'Select option'),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: raceAnswer,
                textQuestion: "race_answer_question",
                width: width,
                dropDownValue: state.race ?? 'Select option'),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: ethnicityAnswer,
                textQuestion: "ethnicity_question",
                width: width,
                dropDownValue: state.ethnicity ?? 'Select option'),
            SizedBox(
              height: height * 0.025,
            ),
            TextFieldNoLabelWidget(
                hintText:
                    state.levelSchool ?? 'High school graduate', // todo check
                requiresTranslate: false,
                text: 'graduate_level'),
            SizedBox(
              height: height * 0.010,
            ),
          ],
        );
      },
    );
  }
}
