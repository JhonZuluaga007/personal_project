import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/main_button_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_no_label_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/home/page/covid_19_test/presentation/widgets/drop_down_questions_widget.dart';
import 'package:personal_project/features/home/widget/lists_text_fields_widgets.dart';
import 'package:personal_project/navigationBar/bloc/navigation_bar_bloc.dart';

import '../../auth/bloc/auth_bloc.dart';
import '../../medical_history/presentation/widgets/confirm_alert_widget.dart';
import '../../medical_history/presentation/widgets/done_alert_widget.dart';
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
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        TextEditingController addressController =
            TextEditingController(text: state.address ?? "");
        TextEditingController cityController =
            TextEditingController(text: state.city ?? "");
        TextEditingController zipController =
            TextEditingController(text: state.zip ?? "");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWithBorderWidget(
              suffixIcon: widget.iconTextField,
              borderColor: wColor.mapColors["T100"],
              requiresTranslate: false,
              textEditingController: addressController,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: wColor.mapColors["S600"]),
              hintText: state.address ?? "",
              textStyle: const TextStyle(fontSize: 18),
              labelText: 'profile_text_seven',
              widthBorder: 3,
            ),
            SizedBox(height: height * 0.0250),
            TextFieldWithBorderWidget(
              suffixIcon: widget.iconTextField,
              borderColor: wColor.mapColors["T100"],
              requiresTranslate: false,
              textEditingController: cityController,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: wColor.mapColors["S600"]),
              hintText: state.city ?? "",
              textStyle: const TextStyle(fontSize: 18),
              labelText: 'profile_text_hint_eigth',
              widthBorder: 3,
            ),
            SizedBox(height: height * 0.0250),
            TextFieldWithBorderWidget(
              suffixIcon: widget.iconTextField,
              requiresTranslate: false,
              borderColor: wColor.mapColors["T100"],
              textEditingController: zipController,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: wColor.mapColors["S600"]),
              hintText: state.zip ?? "050001",
              textStyle: const TextStyle(fontSize: 18),
              labelText: "profile_text_hint_ten",
              widthBorder: 3,
            ),
            SizedBox(height: height * 0.0250),
            DropDownWidgetMyProfile(
              item: lists.stateList,
              fieldText: 'profile_text_hint_nine',
              valueState: state.state ?? defaultValueState,
              width: width,
            ),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: sexAnswer,
                textQuestion: "sex_question",
                width: width,
                dropDownValue: state.sex ?? 'Select option'),
            SizedBox(height: height * 0.0250),
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
            SizedBox(height: height * 0.025),
            TextFieldNoLabelWidget(
                hintText:
                    state.levelSchool ?? 'High school graduate', // todo check
                requiresTranslate: false,
                text: 'graduate_level'),
            SizedBox(height: height * 0.010),
            SizedBox(height: height * 0.0485),
            Center(
              child: MainButtonWidget(
                buttonString: "my_user_button_saved",
                textColor: wColor.mapColors["IDWhite"],
                buttonColor: wColor.mapColors["500BASE"],
                borderColor: wColor.mapColors["500BASE"],
                onPressed: () {
                  confirmSendInfo(
                    context: context,
                    mainIcon: Icon(
                      Icons.warning_amber,
                      size: height * 0.12,
                      color: wColor.mapColors['Warning'],
                    ),
                    titleText: "alert_confirm_text_one",
                    paddingHeight: height * 0.25,
                    infoText: 'alert_confirm_text_two',
                    mainButton: 'alert_confirm_text_three',
                    mainButtonFunction: () {
                      //REVISAR QUE TENGA EXITO Y ACTUALIZAR ESTADO
                      // EN LO CONTRARIO MOSTRAR ERROR ALERTA.
                      doneSendInfo(
                        context: context,
                        mainIcon: Icon(
                          Icons.check,
                          size: height * 0.15,
                          color: wColor.mapColors['C00'],
                        ),
                        titleText: 'alert_text_one',
                        paddingHeight: height * 0.25,
                        infoText: 'alert_text_two',
                        mainButton: 'alert_text_three',
                        mainButtonFunction: () {
                          //todo check if success before
                          //NEED TO INSTANTIATE A BLOC INSIDE THE FUNCTION
                          // BlocProvider.of<AuthBloc>(context).add(
                          //   UserUpdateEvent(
                          //     UserUpdateEntity(
                          //       userdId: state.userId,
                          //       address: addressController.text,
                          //       city: cityController.text,
                          //       zip: zipController.text,
                          //       state: state.state,
                          //       sex: state.sex,
                          //       gender: state.gender,
                          //       race: state.race,
                          //       ethnicity: state.ethnicity,
                          //     ),
                          //   ),
                          // );
                          navigationBloc.add(PageChanged(indexNavigation: 0));
                          Navigator.pushNamed(context, 'navBar');
                        },
                      ); //todo open new alert
                    },
                    secondButton: 'alert_confirm_text_four',
                    secondButtonFunction: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.0485),
          ],
        );
      },
    );
  }
}
