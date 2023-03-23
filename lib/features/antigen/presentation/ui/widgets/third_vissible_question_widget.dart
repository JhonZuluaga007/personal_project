import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Tellme/common_ui/common_widgets/form_field_dropdown_widget.dart';
import 'package:Tellme/config/theme/theme.dart';
import 'package:Tellme/features/antigen/presentation/bloc/antigen_test_bloc.dart';
import 'date_picker_container_widget.dart';

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

  final List<String> vacinneChipList = [];
  final List<String> vaccinesList = [
    "Pfizer",
    "Moderna",
    "Johnson & Johnson",
    "Other",
    "Do not know",
  ];

  late DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;
    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldDropdownWidget(
          question: antigenBloc.state.question7!.name,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.08,
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
            visible: stateAntigen.question7!.value == "No" || _covidQuestionValue != "No",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.025),
                FormFieldDropdownWidget(
                  question: antigenBloc.state.question8!.name,
                  generalColor: wColor.mapColors["S700"]!,
                  height: height * 0.08,
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
                      antigenBloc.add(
                          AntigenQuestion8Event(question8: covidQuestion8!));
                      setState(() {
                        _covidQuestionTwoValue = covidQuestion8;
                      });
                    }
                  },
                ),
                SizedBox(height: height * 0.028),
                DatePickerContainerWidget(
                  textQuestions: antigenBloc.state.question9!.name,
                  date: date,
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2019),
                      lastDate: DateTime.now(),
                    );

                    if (newDate == null) return;

                    setState(() {
                      date = newDate;
                    });
                    antigenBloc.add(
                        AntigenQuestion9Event(question9: newDate.toString()));
                  },
                ),
              ],
            ))
      ],
    );
  }
}
