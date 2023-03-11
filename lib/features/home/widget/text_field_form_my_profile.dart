import 'package:Tellme/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Tellme/config/theme/theme.dart';
import 'package:Tellme/features/auth/domain/entities/options_tools_entity.dart';
import 'package:Tellme/features/home/page/covid_19_test/presentation/widgets/drop_down_questions_widget.dart';
import 'package:Tellme/navigationBar/bloc/navigation_bar_bloc.dart';

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
  /*SexEntity selectedSexValue = SexEntity(id: '', sex: '');
  GenderEntity selectedGenderValue = GenderEntity(id: '', gender: '');
  RaceEntity selectedRaceValue = RaceEntity(id: '', race: '');
  EthnicityEntity selectedEtnichityValue =
      EthnicityEntity(id: '', ethnicity: '');*/
  String selectedStateValue = '';
  String selectedSchoolLevel = '';

  TextEditingController addressController = TextEditingController(text: "");
  TextEditingController cityController = TextEditingController(text: "");
  TextEditingController zipController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);

    //final helperToolsState = BlocProvider.of<HelperToolsBloc>(context).state;
/*
    final List<OpGenderEntity> genderAnswer = helperToolsState.opGender;
    final List<OpSexEntity> sexAnswer = helperToolsState.opSex;
    final List<OpRaceEntity> raceAnswer = helperToolsState.opRace;
    final List<OpEthnicityEntity> ethnicityAnswer =
        helperToolsState.opEthnicity;*/

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: CHECK
            // TextFieldWithBorderWidget(
            //   borderColor: wColor.mapColors["T100"],
            //   requiresTranslate: false,
            //   textEditingController: addressController,
            //   hintStyle: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.w400,
            //       color: wColor.mapColors["S600"]),
            //   hintText: state.address ?? "",
            //   textStyle: const TextStyle(fontSize: 18),
            //   labelText: 'profile_text_seven',
            //   widthBorder: 3,
            // ),
            // SizedBox(height: height * 0.0250),
            // TextFieldWithBorderWidget(
            //   borderColor: wColor.mapColors["T100"],
            //   requiresTranslate: false,
            //   textEditingController: cityController,
            //   hintStyle: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.w400,
            //       color: wColor.mapColors["S600"]),
            //   hintText: state.city ?? "",
            //   textStyle: const TextStyle(fontSize: 18),
            //   labelText: 'profile_text_hint_eigth',
            //   widthBorder: 3,
            // ),
            // SizedBox(height: height * 0.0250),
            // TextFieldWithBorderWidget(
            //   requiresTranslate: false,
            //   borderColor: wColor.mapColors["T100"],
            //   textEditingController: zipController,
            //   hintStyle: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.w400,
            //       color: wColor.mapColors["S600"]),
            //   hintText: state.zip ?? "050001",
            //   textStyle: const TextStyle(fontSize: 18),
            //   labelText: "profile_text_hint_ten",
            //   widthBorder: 3,
            // ),
            // SizedBox(height: height * 0.0250),
            /*DropDownQuestionsWidget(
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
                selectedString: selectedSexValue.sex,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedSexValue = SexEntity(
                        id: valueDropdown.id, sex: valueDropdown.valor);
                  });
                },
                dropDownValue: state.sex!.sex ?? 'Select option'),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: genderAnswer,
                textQuestion: "gender_answer_question",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedGenderValue = GenderEntity(
                        id: valueDropdown.id, gender: valueDropdown.valor);
                  });
                },
                dropDownValue: state.gender!.gender ?? 'Select option'),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: raceAnswer,
                textQuestion: "race_answer_question",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedRaceValue = RaceEntity(
                        id: valueDropdown.id, race: valueDropdown.valor);
                  });
                },
                dropDownValue: state.race!.race ?? 'Select option'),
            SizedBox(height: height * 0.0250),
            DropDownQuestionsWidget(
                dropDownItem: ethnicityAnswer,
                textQuestion: "ethnicity_question",
                width: width,
                onChanged: (valueDropdown) {
                  setState(() {
                    defaultValueSex = valueDropdown!.valor;
                    selectedEtnichityValue = EthnicityEntity(
                        id: valueDropdown.id, ethnicity: valueDropdown.valor);
                  });
                },
                dropDownValue: state.ethnicity!.ethnicity ?? 'Select option'),
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
                                sex: selectedSexValue.sex != ''
                                    ? selectedSexValue
                                    : state.sex,
                                gender: selectedGenderValue.gender != ''
                                    ? selectedGenderValue
                                    : state.gender,
                                race: selectedRaceValue.race != ''
                                    ? selectedRaceValue
                                    : state.race,
                                levelSchool: selectedSchoolLevel != ''
                                    ? selectedSchoolLevel
                                    : state.levelSchool,
                                ethnicity:
                                    selectedEtnichityValue.ethnicity != ''
                                        ? selectedEtnichityValue
                                        : state.ethnicity,
                                file: state.image,
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
            ),*/
            SizedBox(height: height * 0.0485),
          ],
        );
      },
    );
  }
}
