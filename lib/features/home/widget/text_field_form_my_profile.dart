import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/presentation/bloc/auth_bloc.dart';
import '../../auth/domain/entities/user_entity_login.dart';
import '../../home/widget/test_widgets/app_bar_widget.dart';
import '../../auth/domain/entities/user_update_entity.dart';
import '../../auth/presentation/bloc/helper_tools_bloc.dart';
import '../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../test_history/domain/entities/test_history_entity.dart';
import '../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../medical_history/presentation/widgets/done_alert_widget.dart';
import '../../medical_history/presentation/widgets/confirm_alert_widget.dart';
import '../../antigen/presentation/ui/widgets/drop_down_questions_widget.dart';
import '../../../common_ui/common_widgets/text_field/text_field_with_border_widget.dart';

class TextFieldFormMyUser extends StatefulWidget {
  const TextFieldFormMyUser({
    super.key,
    required this.textTitle,
    this.iconTextField,
    required this.hintText,
  });

  final String textTitle;
  final String hintText;
  final Icon? iconTextField;

  // @override
  State<TextFieldFormMyUser> createState() => _TextFieldFormMyUserState();
}

class _TextFieldFormMyUserState extends State<TextFieldFormMyUser> {
  String defaultValueState = 'Select option';
  String defaultValueSex = 'Select option';
  String defaultValueGender = 'Select option';
  String defaultValueRace = 'Select option';
  String defaultValueEthnicity = 'Select option';
  String defaultValueSchool = 'Select option';
  SexEntity selectedSexValue = SexEntity(id: IdTestEntity(oid: ""), sex: '');
  GenderEntity selectedGenderValue =
      GenderEntity(id: IdTestEntity(oid: ""), gender: '');
  RaceEntity selectedRaceValue =
      RaceEntity(id: IdTestEntity(oid: ""), race: '');
  EthnicityEntity selectedEtnichityValue =
      EthnicityEntity(id: IdTestEntity(oid: ""), ethnicity: '');
  StateEntity selectedStateValue =
      StateEntity(id: IdTestEntity(oid: ""), state: "");
  SchoolLevelsEntity selectedSchoolLevel = SchoolLevelsEntity(
      id: IdTestEntity(oid: ""),
      level: "",
      order: 1,
      project: IdTestEntity(oid: ""));

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.height;
    final height = MediaQuery.of(context).size.height;
    final stateHelperTools = BlocProvider.of<HelperToolsBloc>(context).state;
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWithBorderWidget(
              borderColor: wColor.mapColors["T100"],
              requiresTranslate: false,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: wColor.mapColors["S600"]),
              hintText: "Address",
              initialValue: state.address,
              onChanged: (newAddress) =>
                  authBloc.add(UpdateAddress(newAddress)),
              textStyle: const TextStyle(fontSize: 18),
              labelText: 'profile_text_seven',
              widthBorder: 3,
            ),
            SizedBox(height: height * 0.0250),
            TextFieldWithBorderWidget(
              borderColor: wColor.mapColors["T100"],
              requiresTranslate: false,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: wColor.mapColors["S600"]),
              hintText: "City",
              onChanged: (newCity) => authBloc.add(UpdateCity(newCity)),
              initialValue: state.city,
              textStyle: const TextStyle(fontSize: 18),
              labelText: 'profile_text_hint_eigth',
              widthBorder: 3,
            ),
            SizedBox(height: height * 0.0250),
            TextFieldWithBorderWidget(
              requiresTranslate: false,
              borderColor: wColor.mapColors["T100"],
              onChanged: (newZip) => authBloc.add(UpdateZip(newZip)),
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: wColor.mapColors["S600"]),
              hintText: "050001",
              initialValue: state.zip,
              textStyle: const TextStyle(fontSize: 18),
              labelText: "profile_text_hint_ten",
              widthBorder: 3,
            ),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                key: const Key('stateQuestions'),
                dropDownItem: stateHelperTools.state,
                textQuestion: "profile_text_hint_nine",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueState = valueDropdown!.valor;
                    selectedStateValue = StateEntity(
                        id: IdTestEntity(oid: valueDropdown.id),
                        state: valueDropdown.valor);
                  });
                },
                dropDownValue: state.state != null
                    ? state.state!.valor
                    : defaultValueState),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: stateHelperTools.sexes,
                textQuestion: "sex_question",
                width: width,
                selectedString: selectedSexValue.valor,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedSexValue = SexEntity(
                        id: IdTestEntity(oid: valueDropdown.id),
                        sex: valueDropdown.valor);
                  });
                },
                dropDownValue:
                    state.sex != null ? state.sex!.valor : defaultValueSex),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: stateHelperTools.genders,
                textQuestion: "gender_answer_question",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedGenderValue = GenderEntity(
                        id: IdTestEntity(oid: valueDropdown.id),
                        gender: valueDropdown.valor);
                  });
                },
                dropDownValue: state.gender != null
                    ? state.gender!.valor
                    : defaultValueGender),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: stateHelperTools.races,
                textQuestion: "race_answer_question",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedRaceValue = RaceEntity(
                        id: IdTestEntity(oid: valueDropdown.id),
                        race: valueDropdown.valor);
                  });
                },
                dropDownValue:
                    state.race != null ? state.race!.valor : defaultValueRace),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: stateHelperTools.ethnicities,
                textQuestion: "ethnicity_question",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedEtnichityValue = EthnicityEntity(
                        id: IdTestEntity(oid: valueDropdown.id),
                        ethnicity: valueDropdown.valor);
                  });
                },
                dropDownValue: state.ethnicity != null
                    ? state.ethnicity!.valor
                    : defaultValueEthnicity),
            SizedBox(height: height * 0.025),
            DropDownQuestionsWidget(
              dropDownItem: stateHelperTools.schoolLevels,
              textQuestion: "graduate_level",
              width: width,
              onChanged: (valueDropdown) {
                setState(() {
                  defaultValueSchool = valueDropdown!.valor;
                  selectedSchoolLevel = SchoolLevelsEntity(
                      id: IdTestEntity(oid: valueDropdown.id),
                      level: valueDropdown.valor,
                      order: 1,
                      project: IdTestEntity(oid: ""));
                });
              },
              dropDownValue: state.schoolLevels != null
                  ? state.schoolLevels!.level
                  : defaultValueSchool,
            ),
            SizedBox(height: height * 0.010),
            SizedBox(height: height * 0.0485),
            Center(
              child: MainButtonWidget(
                buttonString: "my_user_button_saved",
                textColor: wColor.mapColors["IDWhite"],
                buttonColor: wColor.mapColors["500BASE"],
                borderColor: wColor.mapColors["500BASE"],
                onPressed: () {
                  // if (state.address!.isNotEmpty  ){

                  // }
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
                      doneSendInfo(
                        requiresTranslateText: true,
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
                                address: state.address,
                                city: state.city,
                                zip: state.zip,
                                state: selectedStateValue.valor != ''
                                    ? selectedStateValue
                                    : state.state,
                                sex: selectedSexValue.valor != ''
                                    ? selectedSexValue
                                    : state.sex,
                                gender: selectedGenderValue.valor != ''
                                    ? selectedGenderValue
                                    : state.gender,
                                race: selectedRaceValue.valor != ''
                                    ? selectedRaceValue
                                    : state.race,
                                levelSchool: selectedSchoolLevel.level != ''
                                    ? selectedSchoolLevel
                                    : state.schoolLevels,
                                ethnicity: selectedEtnichityValue.valor != ''
                                    ? selectedEtnichityValue
                                    : state.ethnicity,
                                profileImage: state.profileImage,
                              ),
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
