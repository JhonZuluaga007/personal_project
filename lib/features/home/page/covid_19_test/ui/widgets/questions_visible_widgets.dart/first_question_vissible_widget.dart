import 'package:flutter/material.dart';
import 'package:personal_project/features/medical_history/presentation/widgets/multi_selected_widget.dart';

import '../../../../../../../app_localizations.dart';
import '../../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../../config/theme/theme.dart';
import '../date_picker_container_widget.dart';

class FirstVissibleQuestionWidget extends StatefulWidget {
  FirstVissibleQuestionWidget(
      {Key? key,
      required this.width,
      required this.wColor,
      required this.height,
      required this.firstQuestion,
      required this.dropDownValue})
      : super(key: key);

  final double width;
  final ThemesIdx20 wColor;
  final double height;
  bool firstQuestion;
  String dropDownValue;
  @override
  State<FirstVissibleQuestionWidget> createState() =>
      _FirstVissibleQuestionWidgetState();
}

class _FirstVissibleQuestionWidgetState
    extends State<FirstVissibleQuestionWidget> {
  final List<String> dropdownItem = [
    "self_t__drop_down_text",
    "self_t_drop_down_text_1"
  ];
  final List<String> firstQuestion = [
    "symptoms_dropdown_one",
    "symptoms_dropdown_two",
    "symptoms_dropdown_three",
    "symptoms_dropdown_four",
    "symptoms_dropdown_five",
    "symptoms_dropdown_six",
    "symptoms_dropdown_seven",
    "symptoms_dropdown_eight",
    "symptoms_dropdown_nine",
    "symptoms_dropdown_ten",
    "symptoms_dropdown_eleven",
    "symptoms_dropdown_twelve",
    "symptoms_dropdown_thirdteen",
    "symptoms_dropdown_fourteen",
    "symptoms_dropdown_fiveteen",
    "symptoms_dropdown_sixteen",
    "symptoms_dropdown_seventeen"
  ];

  final List<String> firstQuestionChipLIst = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: "self_t_question_test_drop_down_00",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
              color: widget.wColor.mapColors["S700"]),
        ),
        SizedBox(
            height: /*widget.heightSizedBoxText??  */ widget.height * 0.0025),
        SizedBox(
          width: widget.width,
          height: widget.height * 0.07,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        width: 1, color: widget.wColor.mapColors["IDGrey"]!))),
            items: dropdownItem.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: AppLocalizations.of(context)!.translate(value),
                  child: Padding(
                    padding: EdgeInsets.only(left: widget.width * 0.028),
                    child: TextWidget(
                      textAlign: TextAlign.center,
                      text: value,
                      style:
                          // widget.dropTextStyle ??
                          TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.2,
                              color: widget.wColor.mapColors["S600"]),
                    ),
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
                if (widget.dropDownValue == 'Yes' ||
                    widget.dropDownValue == 'Si') {
                  widget.firstQuestion = true;
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
                MultiSelectedWidget(
                  listItem: firstQuestion, 
                  onChanged: (value){
                    setState(() {
                      if (firstQuestionChipLIst.contains(value) != true) {
                        firstQuestionChipLIst.add(value.toString());
                      }
                    });
                  }, 
                  valueDefaultList: "drop_down_select_option",
                  listChip: firstQuestionChipLIst, 
                  requiredTranslate: true,
                ),
                SizedBox(height: widget.height * 0.028),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: widget.width * 0.037),
                  child: const DatePickerContainerWidget(
                      textQuestions: "self_t_question_test_drop_down_02"),
                ),
              ],
            ))
      ],
    );
  }
}
