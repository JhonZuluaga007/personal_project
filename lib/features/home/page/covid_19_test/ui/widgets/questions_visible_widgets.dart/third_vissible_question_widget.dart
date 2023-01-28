import 'package:flutter/material.dart';

import '../../../../../../../app_localizations.dart';
import '../../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../../config/theme/theme.dart';
import '../date_picker_container_widget.dart';
import '../drop_down_questions_widget.dart';

//TODO
//How many boosters have you sad so far
//when did you receive your most recent covid-19 vaccine date
//Which vaccines did you receive
class ThirdVissibleQuestionWidget extends StatefulWidget {
  ThirdVissibleQuestionWidget(
      {Key? key,
      required this.width,
      required this.wColor,
      required this.height,
      required this.dropdownItem,
      required this.firstQuestion,
      required this.dropDownValue})
      : super(key: key);

  final double width;
  final ThemesIdx20 wColor;
  final double height;
  final List<String> dropdownItem;
  bool firstQuestion;
  String dropDownValue;
  @override
  State<ThirdVissibleQuestionWidget> createState() =>
      _ThirdVissibleQuestionWidgetState();
}

class _ThirdVissibleQuestionWidgetState
    extends State<ThirdVissibleQuestionWidget> {
  final List<String> dropdownBooster = [
    "booster_answer_one",
    "booster_answer_two",
    "booster_answer_three",
    "booster_answer_four",
  ];
  final List<String> vaccinesList = [
    "vaccines_answer_one",
    "vaccines_answer_two",
    "vaccines_answer_three",
    "vaccines_answer_four",
    "vaccines_answer_five",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: "self_t_question_test_drop_down_03",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
              color: widget.wColor.mapColors["S700"]),
        ),
        SizedBox(height: widget.height * 0.0025),
        SizedBox(
          width: widget.width,
          height: widget.height * 0.07,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        width: 1, color: widget.wColor.mapColors["IDGrey"]!))),
            items: widget.dropdownItem
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: AppLocalizations.of(context)!.translate(value),
                  child: TextWidget(
                    textAlign: TextAlign.center,
                    text: value,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.2,
                        color: widget.wColor.mapColors["S600"]),
                  ));
            }).toList(),
            hint: Text(
              'Select option',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.2,
                  color: widget.wColor.mapColors["S600"]),
            ),
            icon: const Icon(Icons.arrow_downward),
            // widget.iconWidget,
            iconSize: 12,
            borderRadius: BorderRadius.circular(5),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.2,
                color: widget.wColor.mapColors["S600"]),
            dropdownColor: widget.wColor.mapColors["P01"],
            onChanged: (valueDropdown) {
              setState(() {
                widget.dropDownValue = valueDropdown.toString();
                if (widget.dropDownValue == 'Yes, 1 Dose' ||
                    widget.dropDownValue == 'Si, 1 Dosis' ||
                    widget.dropDownValue == 'Yes, 2 Dose' ||
                    widget.dropDownValue == 'Si, 2 Dosis') {
                  widget.firstQuestion = true;
                  debugPrint('first true');
                } else {
                  widget.firstQuestion = false;
                }
              });
            },
          ),
        ),
        Visibility(
            visible: widget.firstQuestion,
            child: Column(
              children: [
                SizedBox(height: widget.height * 0.031),
                DropDownQuestionsWidget(
                    dropDownItem: dropdownBooster,
                    textQuestion: "self_t_question_test_drop_down_05",
                    width: widget.width,
                    dropDownValue: 'Select option'),
                SizedBox(height: widget.height * 0.028),
                const DatePickerContainerWidget(
                    textQuestions: "self_t_question_vissible_5"),
                SizedBox(height: widget.height * 0.028),
                DropDownQuestionsWidget(
                    //TODO
                    //ADD MULTI SELECT Widget
                    dropDownItem: vaccinesList,
                    textQuestion: "self_t_question_vissible_6",
                    width: widget.width,
                    dropDownValue: 'Select option'),
              ],
            ))
      ],
    );
  }
}
