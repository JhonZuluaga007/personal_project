import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../auth/domain/entities/options_tools_entity.dart';
import '../../../../antigen/presentation/bloc/antigen_test_bloc.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_widgets/form_field_dropdown_widget.dart';
import '../../../../antigen/presentation/ui/widgets/multi_selector_string_widget.dart';

class FourQuestionWidget extends StatefulWidget {
  const FourQuestionWidget({Key? key}) : super(key: key);

  @override
  State<FourQuestionWidget> createState() => _FourQuestionWidgetState();
}

class _FourQuestionWidgetState extends State<FourQuestionWidget> {
  String _covidQuestionPregnantValue = "Select option";
  String _covidQuestionValue = "";

  final List<String> covidBeforechipList = [];
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
    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);

    return Column(
      children: [
        TextWidget(
          text: antigenBloc.state.question11!.name,
          requiresTranslate: false,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
              color: wColor.mapColors["S700"]!),
        ),
        MultiSelectedStringWidget(
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
          requiredTranslate: false,
          listChip: covidBeforechipList,
          valueDefaultList: "drop_down_select_option",
        ),
        SizedBox(height: height * 0.031),
        FormFieldDropdownWidget(
          question: antigenBloc.state.question12!.name,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.11,
          listItems: const [
            "Select option",
            "Not Pregnant",
            "Pregnant",
            "Unknown",
            "Not Applicable",
          ],
          selectedValue: antigenBloc.state.question12!.value.isNotEmpty
              ? antigenBloc.state.question12!.value
              : _covidQuestionPregnantValue,
          width: width,
          onChanged: (covidQuestion12) {
            if (covidQuestion12 != "Select option") {
              antigenBloc
                  .add(AntigenQuestion12Event(question12: covidQuestion12!));
              setState(() {
                _covidQuestionPregnantValue = covidQuestion12;
              });
            }
          },
        ),
      ],
    );
  }
}
