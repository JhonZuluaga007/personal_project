import 'package:flutter/material.dart';
import 'date_picker_container_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/antigen_test_bloc.dart';
import '../../../../../config/theme/theme.dart';
import '../../../../../common_ui/common_widgets/form_field_dropdown_widget.dart';

class SecondVissibleQuestionWidget extends StatefulWidget {
  const SecondVissibleQuestionWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SecondVissibleQuestionWidget> createState() =>
      _SecondVissibleQuestionWidgetState();
}

class _SecondVissibleQuestionWidgetState
    extends State<SecondVissibleQuestionWidget> {
  late DateTime date = DateTime.now();
  String _covidQuestionValue = "Select option";
  String _covidQuestionTwoValue = "Select option";

  @override
  void initState() {
    final state = BlocProvider.of<AntigenTestBloc>(context).state;
    _covidQuestionValue = state.question4!.value.isNotEmpty
        ? state.question4!.value
        : "Select option";
    _covidQuestionTwoValue = state.question6!.value.isNotEmpty
        ? state.question6!.value
        : "Select option";
    super.initState();
  }

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
          question: stateAntigen.question4!.name,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.11,
          listItems: const [
            "Select option",
            "Yes",
            "No",
          ],
          selectedValue: _covidQuestionValue,
          width: width,
          onChanged: (covidQuestion) {
            antigenBloc.add(AntigenQuestion4Event(question4: covidQuestion!));
            setState(() {
              _covidQuestionValue = covidQuestion;
            });
          },
        ),
        Visibility(
          visible: stateAntigen.question4!.value == "Yes" ||
              _covidQuestionValue == "Yes",
          child: Column(
            children: [
              SizedBox(height: height * 0.028),
              DatePickerContainerWidget(
                textQuestions: antigenBloc.state.question5!.name,
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
                      AntigenQuestion5Event(question5: newDate.toString()));
                },
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.015),
        FormFieldDropdownWidget(
          question: stateAntigen.question6!.name,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.11,
          listItems: const [
            "Select option",
            "Yes",
            "No",
          ],
          selectedValue: _covidQuestionTwoValue,
          width: width,
          onChanged: (covidQuestionTwo) {
            antigenBloc
                .add(AntigenQuestion6Event(question6: covidQuestionTwo!));
            setState(() {
              _covidQuestionTwoValue = covidQuestionTwo;
            });
          },
        ),
      ],
    );
  }
}
