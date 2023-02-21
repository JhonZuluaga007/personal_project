import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/form_field_dropdown_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/antigen/presentation/bloc/antigen_test_bloc.dart';
import 'package:personal_project/features/medical_history/presentation/widgets/multi_selected_widget.dart';

class FourQuestionWidget extends StatefulWidget {
  const FourQuestionWidget({Key? key}) : super(key: key);

  @override
  State<FourQuestionWidget> createState() => _FourQuestionWidgetState();
}

class _FourQuestionWidgetState extends State<FourQuestionWidget> {
  String _covidQuestionPregnantValue = "";
  final List<String> covidBeforechipList = [];
  final List<String> covidBeforeAnswer = [
    "covid_before_one",
    "covid_before_two",
    "covid_before_three",
    "covid_before_four",
  ];

  final List<String> vacinneChipList = [];
  final List<String> vaccinesList = [
    "Pfizer",
    "Moderna",
    "Johnson & Johnson",
    "Other",
    "Do not know",
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
    return Column(
      children: [
        SizedBox(height: height * 0.031),
        TextWidget(
          text: antigenBloc.state.question10!.name!,
          requiresTranslate: false,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
              color: wColor.mapColors["S700"]!),
        ),
        SizedBox(height: height * 0.011),
        MultiSelectedWidget(
          listItem: vaccinesList,
          onChanged: (value) {
            setState(() {
              if (vacinneChipList.contains(value) != true) {
                vacinneChipList.add(value.toString());
              }
            });
            antigenBloc
                .add(AntigenQuestion10Event(question10: vacinneChipList));
          },
          requiredTranslate: false,
          listChip: vacinneChipList,
          valueDefaultList: "drop_down_select_option",
        ),
        SizedBox(height: height * 0.031),
        TextWidget(
          text: antigenBloc.state.question11!.name!,
          requiresTranslate: false,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
              color: wColor.mapColors["S700"]!),
        ),
        MultiSelectedWidget(
          listItem: covidBeforeAnswer,
          onChanged: (value) {
            setState(() {
              if (covidBeforechipList.contains(value) != true) {
                covidBeforechipList.add(value.toString());
              }
            });
            antigenBloc
                .add(AntigenQuestion11Event(question11: covidBeforechipList));
          },
          requiredTranslate: true,
          listChip: covidBeforechipList,
          valueDefaultList: "drop_down_select_option",
        ),
        SizedBox(height: height * 0.031),
        FormFieldDropdownWidget(
          question: antigenBloc.state.question12!.name!,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.07,
          listItems: const [
            "",
            "Not Pregnant",
            "Pregnant",
            "Unknown",
            "Not Applicable",
          ],
          selectedValue: _covidQuestionPregnantValue,
          width: width,
          onChanged: (cryptoMonthlyAmount) {
            antigenBloc.add(
                AntigenQuestion12Event(question12: [cryptoMonthlyAmount!]));
            setState(() {
              _covidQuestionPregnantValue = cryptoMonthlyAmount;
            });
          },
        ),
      ],
    );
  }
}
