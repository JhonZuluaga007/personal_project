import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/main_button_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_no_label_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/common_ui/utils/const_list.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/auth/bloc/helper_tools_bloc.dart';
import 'package:personal_project/features/auth/domain/entities/helper_tools_entity.dart';
import 'package:personal_project/features/home/page/covid_19_test/presentation/widgets/drop_down_questions_widget.dart';
import 'package:personal_project/navigationBar/bloc/navigation_bar_bloc.dart';

import '../../auth/bloc/auth_bloc.dart';
import '../../auth/domain/entities/user_update_entity.dart';
import '../../medical_history/presentation/widgets/confirm_alert_widget.dart';
import '../../medical_history/presentation/widgets/done_alert_widget.dart';

class TextFieldFormMyUser extends StatefulWidget {
  const TextFieldFormMyUser(
      {super.key,
      required this.textTitle,
      this.iconTextField,
      required this.hintText,
      this.imageState});

  final String textTitle;
  final String hintText;
  final Icon? iconTextField;
  final String? imageState;

  @override
  State<TextFieldFormMyUser> createState() => _TextFieldFormMyUserState();
}

class _TextFieldFormMyUserState extends State<TextFieldFormMyUser> {
  String defaultValueState = 'Select option';
  String defaultValueSex = 'Select option';
  String defaultValueGender = 'Select option';
  String defaultValueRace = 'Select option';
  String defaultValueEthnicity = 'Select option';
  String defaultValueSchool = 'Select option';
  String selectedSexValue = '';
  String selectedGenderValue = '';
  String selectedRaceValue = '';
  String selectedEtnichityValue = '';
  String selectedStateValue = '';
  String selectedSchoolLevel = '';

  TextEditingController addressController = TextEditingController(text: "");
  TextEditingController cityController = TextEditingController(text: "");
  TextEditingController zipController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);

    final helperToolsState = BlocProvider.of<HelperToolsBloc>(context).state;

    final List<OpGenderEntity> genderAnswer = helperToolsState.opGender;
    final List<OpSexEntity> sexAnswer = helperToolsState.opSex;
    final List<OpRaceEntity> raceAnswer = helperToolsState.opRace;
    final List<OpEthnicityEntity> ethnicityAnswer =
        helperToolsState.opEthnicity;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWithBorderWidget(
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
            DropDownQuestionsWidget(
                dropDownItem: ConstLists.stateList,
                textQuestion: "profile_text_hint_nine",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueState = valueDropdown!.valor;
                    selectedStateValue = valueDropdown.valor;
                  });
                },
                dropDownValue: state.state ?? 'Select option'),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: sexAnswer,
                textQuestion: "sex_question",
                width: width,
                selectedString: selectedSexValue,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedSexValue = valueDropdown.id;
                  });
                },
                dropDownValue: state.sex ?? 'Select option'),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: genderAnswer,
                textQuestion: "gender_answer_question",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedGenderValue = valueDropdown.id;
                  });
                },
                dropDownValue: state.gender ?? 'Select option'),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: raceAnswer,
                textQuestion: "race_answer_question",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedRaceValue = valueDropdown.id;
                  });
                },
                dropDownValue: state.race ?? 'Select option'),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: ethnicityAnswer,
                textQuestion: "ethnicity_question",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedEtnichityValue = valueDropdown.id;
                  });
                },
                dropDownValue: state.ethnicity ?? 'Select option'),
            SizedBox(height: height * 0.025),
            DropDownQuestionsWidget(
                dropDownItem: ConstLists.schoolLevelList,
                textQuestion: "graduate_level",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSchool = valueDropdown!.valor;
                    selectedSchoolLevel = valueDropdown.id;
                  });
                },
                dropDownValue: state.levelSchool ?? 'Select option'),
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
                          BlocProvider.of<AuthBloc>(context).add(
                            UserUpdateEvent(
                              UserUpdateEntity(
                                  userdId: state.userId,
                                  address: addressController.text != ''
                                      ? addressController.text
                                      : state.address,
                                  city: cityController.text != ''
                                      ? cityController.text
                                      : state.city,
                                  zip: zipController.text != ''
                                      ? zipController.text
                                      : state.zip,
                                  state: selectedStateValue != ''
                                      ? selectedStateValue
                                      : state.state,
                                  sex: selectedSexValue != ''
                                      ? selectedSexValue
                                      : state.sex,
                                  gender: selectedGenderValue != ''
                                      ? selectedGenderValue
                                      : state.gender,
                                  race: selectedRaceValue != ''
                                      ? selectedRaceValue
                                      : state.race,
                                  levelSchool: selectedSchoolLevel != ''
                                      ? selectedSchoolLevel
                                      : state.levelSchool,
                                  ethnicity: selectedEtnichityValue != ''
                                      ? selectedEtnichityValue
                                      : state.ethnicity,
                                  file: widget.imageState),
                            ),
                          );
                          navigationBloc.add(PageChanged(indexNavigation: 0));
                          Navigator.pushNamed(context, 'navBar');
                        },
                      );
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
