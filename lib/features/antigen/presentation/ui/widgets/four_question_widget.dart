import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../auth/presentation/bloc/helper_tools_bloc.dart';
import '../../../../auth/domain/entities/options_tools_entity.dart';
import '../../../../antigen/presentation/bloc/antigen_test_bloc.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_widgets/form_field_dropdown_widget.dart';
import '../../../../antigen/presentation/ui/widgets/multi_selector_string_widget.dart';
import '../../../../medical_history/presentation/widgets/multi_selected_opdropdown_widget.dart';

class FourQuestionWidget extends StatefulWidget {
  const FourQuestionWidget({Key? key}) : super(key: key);

  @override
  State<FourQuestionWidget> createState() => _FourQuestionWidgetState();
}

class _FourQuestionWidgetState extends State<FourQuestionWidget> {
  String _covidQuestionPregnantValue = "Select option";
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
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;
    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
    final stateHelperTools = BlocProvider.of<HelperToolsBloc>(context).state;

    return Column(
      children: [
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
              if (stateAntigen.vaccines!.contains(value) != true) {
                vacinneChipList.add(value! as OpVaccineEntity);
                stateAntigen.vaccines = vacinneChipList;
                debugPrint(vacinneChipList.toString());
              }
              antigenBloc
                  .add(AntigenQuestion10Event(vaccines: vacinneChipList));
            });
          },
          listItem: stateHelperTools.vaccines,
          valueDefaultList: "drop_down_select_option",
          listChip: stateAntigen.vaccines ?? vacinneChipList,
          requiredTranslate: false,
        ),
        SizedBox(height: height * 0.031),
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
          listChip: stateAntigen.question11!.value != covidBeforechipList
              ? stateAntigen.question11!.value
              : covidBeforechipList,
          valueDefaultList: "drop_down_select_option",
        ),
        SizedBox(height: height * 0.031),
        FormFieldDropdownWidget(
          question: antigenBloc.state.question12!.name,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.07,
          listItems: const [
            "Select option",
            "Not Pregnant",
            "Pregnant",
            "Unknown",
            "Not Applicable",
          ],
          selectedValue: _covidQuestionPregnantValue,
          width: width,
          onChanged: (covidQuestion12) {
            if (covidQuestion12 != "Select option") {
              antigenBloc
                  .add(AntigenQuestion12Event(question12: [covidQuestion12!]));
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
