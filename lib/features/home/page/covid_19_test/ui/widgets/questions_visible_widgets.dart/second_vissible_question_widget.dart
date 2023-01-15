import 'package:flutter/material.dart';

import '../../../../../../../app_localizations.dart';
import '../../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../../config/theme/theme.dart';
import '../date_picker_container_widget.dart';

class SecondVissibleQuestionWidget extends StatefulWidget {
  SecondVissibleQuestionWidget(
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
  State<SecondVissibleQuestionWidget> createState() =>
      _SecondVissibleQuestionWidgetState();
}

class _SecondVissibleQuestionWidgetState
    extends State<SecondVissibleQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: widget.width * 0.039),
          child: TextWidget(
            text: "self_t_question_vissible_2",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.2,
                color: widget.wColor.mapColors["S700"]),
          ),
        ),
        SizedBox(
            height: /*widget.heightSizedBoxText??  */ widget.height * 0.0025),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.width * 0.039),
          child: SizedBox(
            width: widget.width,
            height: widget.height * 0.07,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                          width: 1, color: widget.wColor.mapColors["T100"]!))),
              items: widget.dropdownItem
                  .map<DropdownMenuItem<String>>((String value) {
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
              hint: Padding(
                padding: EdgeInsets.only(left: widget.width * 0.028),
                child: Text(
                  'Select option',
                  // widget.dropDownValue,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.2,
                      color: widget.wColor.mapColors["S600"]),
                ),
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
                    print('first true');
                  } else {
                    widget.firstQuestion = false;
                  }
                });
              },
            ),
          ),
        ),
        Visibility(
            visible: widget.firstQuestion,
            child: Column(
              children: [
                //TODO FIRST ONE CHANGE IT FOR MULTISELECTOR
                SizedBox(height: widget.height * 0.028),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: widget.width * 0.037),
                  child: const DatePickerContainerWidget(
                      textQuestions: "self_t_question_vissible_3"),
                ),
              ],
            ))
      ],
    );
  }
}
