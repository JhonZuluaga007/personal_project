import 'package:Tellme/features/antigen/presentation/ui/widgets/date_picker_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/antigen_test_bloc.dart';
import '../../../../../config/theme/theme.dart';
import '../../../../auth/presentation/bloc/helper_tools_bloc.dart';
import '../../../../auth/domain/entities/options_tools_entity.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_widgets/form_field_dropdown_widget.dart';
import '../../../../medical_history/presentation/widgets/multi_selected_opdropdown_widget.dart';

class ThirdVissibleQuestionWidget extends StatefulWidget {
  const ThirdVissibleQuestionWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ThirdVissibleQuestionWidget> createState() =>
      _ThirdVissibleQuestionWidgetState();
}

class _ThirdVissibleQuestionWidgetState
    extends State<ThirdVissibleQuestionWidget> {
  String _covidQuestionValue = "";
  String _covidQuestionTwoValue = "Select option";
  final TextEditingController dateController = TextEditingController();
  final List<String> covidBeforechipList = [];

  late DateTime datePicker = DateTime.now();

  final List<String> covidBeforeAnswer = [
    "No",
    "Yes, 2020",
    "Yes, 2021",
    "Yes, 2022",
    "Yes, 2023"
  ];
  List<OpVaccineEntity> vacinneChipList = [];

  @override
  void initState() {
    final state = BlocProvider.of<AntigenTestBloc>(context).state;
    vacinneChipList.addAll(state.vaccines!);
    covidBeforechipList.addAll(state.question11!.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;
    final stateHelperTools = BlocProvider.of<HelperToolsBloc>(context).state;

    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldDropdownWidget(
          question: antigenBloc.state.question7!.name,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.11,
          listItems: const [
            "",
            "No",
            "Yes, 1 Dose",
            "Yes, 2 Doses",
            "Yes, 3 Doses",
            "Yes, 4 Doses",
          ],
          selectedValue: stateAntigen.question7!.value != _covidQuestionValue
              ? stateAntigen.question7!.value
              : _covidQuestionValue,
          width: width,
          onChanged: (question7Covid) {
            antigenBloc.add(AntigenQuestion7Event(question7: question7Covid!));
            setState(() {
              _covidQuestionValue = question7Covid;
            });
          },
        ),
        Visibility(
          visible: stateAntigen.question7!.value == 'Yes, 1 Dose' ||
              _covidQuestionValue == 'Yes, 1 Dose' ||
              stateAntigen.question7!.value == 'Yes, 2 Doses' ||
              _covidQuestionValue == 'Yes, 2 Doses' ||
              stateAntigen.question7!.value == 'Yes, 3 Doses' ||
              _covidQuestionValue == 'Yes, 3 Doses' ||
              stateAntigen.question7!.value == 'Yes, 4 Doses' ||
              _covidQuestionValue == 'Yes, 4 Doses',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.025),
              FormFieldDropdownWidget(
                question: antigenBloc.state.question8!.name,
                generalColor: wColor.mapColors["S700"]!,
                height: height * 0.11,
                listItems: const [
                  "Select option",
                  "None",
                  "1 Booster.",
                  "2 Boosters.",
                  "More than 2 Boosters",
                ],
                selectedValue:
                    stateAntigen.question8!.value != _covidQuestionTwoValue ||
                            stateAntigen.question8!.value.isNotEmpty
                        ? stateAntigen.question8!.value
                        : _covidQuestionTwoValue,
                width: width,
                onChanged: (covidQuestion8) {
                  if (covidQuestion8 != "Select option") {
                    antigenBloc
                        .add(AntigenQuestion8Event(question8: covidQuestion8!));
                    setState(() {
                      _covidQuestionTwoValue = covidQuestion8;
                    });
                  }
                },
              ),
              SizedBox(height: height * 0.028),
              DatePickerContainerWidget(
                  colorIcon: wColor.mapColors['IDPink'],
                  colorBorder: wColor.mapColors['IDGrey'],
                  radiusBorderInput: 10,
                  textQuestions:
                      'When did you receive your most recent COVID-19 vaccine?',
                  onTap: () async {
                    final newDatePicker = await showDatePicker(
                      context: context,
                      initialDate: datePicker,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                            data: Theme.of(context).copyWith(
                              dialogBackgroundColor: wColor.mapColors['P01']!,
                              colorScheme: ColorScheme.light(
                                primary: wColor.mapColors[
                                    'IDPink']!, // header background color
                                onPrimary: wColor
                                    .mapColors['P01']!, // header text color
                                onSurface:
                                    wColor.mapColors['P00']!, // body text color
                              ),
                            ),
                            child: child!);
                      },
                    );
                    if (newDatePicker != null) {
                      datePicker = newDatePicker;
                      antigenBloc.add(AntigenQuestion9Event(
                          question9: newDatePicker.toString()));
                    } else {
                      // DateTime constTime = DateTime.now().toLocal();
                      antigenBloc.add(AntigenQuestion9Event(
                          question9: datePicker.toString()));
                    }
                    setState(() {});
                  },
                  date: datePicker),
              SizedBox(height: height * 0.031),
              TextWidget(
                text: antigenBloc.state.question10!.name,
                requiresTranslate: false,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.2,
                    color: wColor.mapColors["S700"]!),
              ),
              SizedBox(height: height * 0.011),
              MultiSelectedOpDropDownWidget(
                onChanged: (value) {
                  setState(() {
                    if (vacinneChipList
                        .where((vacinne) => vacinne.id == value!.id)
                        .isEmpty) {
                      vacinneChipList.add(value as OpVaccineEntity);
                    }
                    antigenBloc
                        .add(AntigenQuestion10Event(vaccines: vacinneChipList));
                  });
                },
                listItem: stateHelperTools.vaccines,
                valueDefaultList: "drop_down_select_option",
                listChip: vacinneChipList,
                requiredTranslate: false,
              ),
              SizedBox(height: height * 0.031),
            ],
          ),
        )
      ],
    );
  }
}
