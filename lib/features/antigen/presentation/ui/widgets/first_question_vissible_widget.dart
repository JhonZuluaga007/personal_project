import 'package:flutter/material.dart';
import 'date_picker_container_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/antigen_test_bloc.dart';
import '../../../../../config/theme/theme.dart';
import '../../../../auth/presentation/bloc/helper_tools_bloc.dart';
import '../../../../auth/domain/entities/options_tools_entity.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_widgets/form_field_dropdown_widget.dart';
import '../../../../medical_history/presentation/widgets/multi_selected_opdropdown_widget.dart';

class FirstVissibleQuestionWidget extends StatefulWidget {
  const FirstVissibleQuestionWidget({Key? key}) : super(key: key);

  @override
  State<FirstVissibleQuestionWidget> createState() =>
      _FirstVissibleQuestionWidgetState();
}

class _FirstVissibleQuestionWidgetState
    extends State<FirstVissibleQuestionWidget> {
  final List<String> firstQuestionChipLIst = [];

  late DateTime date = DateTime.now();
  String _covidQuestionValue = "Select option";
  List<OpSymptomEntity> symptomChipList = [];

  @override
  void initState() {
    final state = BlocProvider.of<AntigenTestBloc>(context).state;
    _covidQuestionValue = state.question1!.value.isNotEmpty
        ? state.question1!.value
        : 'Select option';
    symptomChipList.addAll(state.symptoms!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
    final antigenState = antigenBloc.state;
    final stateHelperTools = BlocProvider.of<HelperToolsBloc>(context).state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldDropdownWidget(
          question: antigenState.question1!.name,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.1,
          listItems: const [
            "Select option",
            "Yes",
            "No",
          ],
          selectedValue: _covidQuestionValue,
          width: width,
          onChanged: (cryptoMonthlyAmount) {
            antigenBloc.add(AntigenQuestion1Event(cryptoMonthlyAmount!));
            setState(() {
              _covidQuestionValue = cryptoMonthlyAmount;
              if (_covidQuestionValue == 'No') {
                symptomChipList = [];
              }
            });
          },
        ),
        SizedBox(height: height * 0.021),
        Visibility(
          visible: antigenState.question1!.value == "Yes" ||
              _covidQuestionValue == "Yes",
          child: Column(
            children: [
              TextWidget(
                text: antigenState.question2!.name,
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
                    if (symptomChipList
                        .where((symptom) => symptom.id == value!.id)
                        .isEmpty) {
                      symptomChipList.add(value as OpSymptomEntity);
                    }
                    antigenBloc
                        .add(AntigenQuestion2Event(symptoms: symptomChipList));
                  });
                },
                listItem: stateHelperTools.symptoms,
                valueDefaultList: "drop_down_select_option",
                listChip: symptomChipList,
                requiredTranslate: false,
              ),
              SizedBox(height: height * 0.028),
              DatePickerContainerWidget(
                //TODO CHECK THE QUESTION..... Bringing a bad info.
                textQuestions:
                    'When did you start experiencing these symptoms?' /*antigenState.question3!.name*/,
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
                      AntigenQuestion3Event(question3: newDate.toString()));
                },
                date: date,
              ),
            ],
          ),
        )
      ],
    );
  }
}
