import 'package:flutter/material.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
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
  final TextEditingController dateController = TextEditingController();

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
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'When did you test positive for COVID-19?',
                    style: TextStyle(
                        fontSize: 16,
                        color: wColor.mapColors['S700'],
                        fontWeight: FontWeight.w500),
                    requiresTranslate: false,
                  ),
                ],
              ),
              SizedBox(height: height * 0.018),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: wColor.mapColors['IDGrey']!)),
                child: GestureDetector(
                    onTap: () async {
                      final newDatePicker = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2020),
                        firstDate: DateTime(2019),
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
                                  onSurface: wColor
                                      .mapColors['P00']!, // body text color
                                ),
                              ),
                              child: child!);
                        },
                      );
                      if (newDatePicker != null) {
                        antigenBloc.add(AntigenQuestion5Event(
                            question5: newDatePicker.toString()));
                        dateController.text =
                            '${newDatePicker.month}/${newDatePicker.day}/${newDatePicker.year}';
                      }
                    },
                    child: TextFieldWithBorderWidget(
                      requiresTranslate: false,
                      enabled: false,
                      width: width * 0.9,
                      height: height * 0.09,
                      labelText: '12_validate_identity_label_text_eleven',
                      hintText: 'MM/DD/YYYY',
                      suffixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            Icons.calendar_today,
                            color: wColor.mapColors['IDPink'],
                          )),
                      textEditingController: dateController,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
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
