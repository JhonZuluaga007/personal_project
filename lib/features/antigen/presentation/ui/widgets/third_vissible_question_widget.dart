import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/form_field_dropdown_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/antigen/presentation/bloc/antigen_test_bloc.dart';
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
  String _covidQuestionTwoValue = "";

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
    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldDropdownWidget(
          question: antigenBloc.state.question7!.name!,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.08,
          listItems: const [
            "",
            "No",
            "Yes, 1 Dose",
            "Yes, 2 Dose",
          ],
          selectedValue: _covidQuestionValue,
          width: width,
          onChanged: (cryptoMonthlyAmount) {
            antigenBloc
                .add(AntigenQuestion7Event(question7: cryptoMonthlyAmount!));
            setState(() {
              _covidQuestionValue = cryptoMonthlyAmount;
            });
          },
        ),
        Visibility(
            visible: _covidQuestionValue != "No",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.025),
                FormFieldDropdownWidget(
                  question: antigenBloc.state.question8!.name!,
                  generalColor: wColor.mapColors["S700"]!,
                  height: height * 0.08,
                  listItems: const [
                    "",
                    "None",
                    "1 Booster.",
                    "2 Boosters.",
                    "More than 2 Boosters",
                  ],
                  selectedValue: _covidQuestionTwoValue,
                  width: width,
                  onChanged: (cryptoMonthlyAmount) {
                    antigenBloc.add(
                        AntigenQuestion8Event(question8: cryptoMonthlyAmount!));
                    setState(() {
                      _covidQuestionTwoValue = cryptoMonthlyAmount;
                    });
                  },
                ),
                SizedBox(height: height * 0.028),
                DatePickerContainerWidget(
                  textQuestions: antigenBloc.state.question9!.name!,
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
