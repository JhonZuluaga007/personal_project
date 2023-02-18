import 'package:flutter/material.dart';
import 'package:personal_project/features/medical_history/presentation/widgets/multi_selected_widget.dart';

import '../../../../../../../app_localizations.dart';
import '../../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../../config/theme/theme.dart';
import '../date_picker_container_widget.dart';

//TODO
//How many boosters have you sad so far
//when did you receive your most recent covid-19 vaccine date
//Which vaccines did you receive
class ThirdVissibleQuestionWidget extends StatefulWidget {
  const ThirdVissibleQuestionWidget(
      {Key? key,
      
      required this.dropdownItem})
      : super(key: key);

  final List<String> dropdownItem;
  @override
  State<ThirdVissibleQuestionWidget> createState() =>
      _ThirdVissibleQuestionWidgetState();
}

class _ThirdVissibleQuestionWidgetState
    extends State<ThirdVissibleQuestionWidget> {
  final List<String> dropdownBoosterChipList = [];
  final List<String> dropdownBooster = [
    "booster_answer_one",
    "booster_answer_two",
    "booster_answer_three",
    "booster_answer_four",
  ];

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: "self_t_question_test_drop_down_03",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
              color: wColor.mapColors["S700"]),
        ),
        SizedBox(height: height * 0.0025),
        SizedBox(
          width:width,
          height: height * 0.07,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        width: 1, color: wColor.mapColors["IDGrey"]!))),
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
                        color: wColor.mapColors["S600"]),
                  ));
            }).toList(),
            hint: Text(
              'Select option',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.2,
                  color: wColor.mapColors["S600"]),
            ),
            icon: const Icon(Icons.arrow_downward),
            iconSize: 12,
            borderRadius: BorderRadius.circular(5),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.2,
                color: wColor.mapColors["S600"]),
            dropdownColor: wColor.mapColors["P01"],
            onChanged: (valueDropdown) {
              setState(() {
                /*widget.dropDownValue = valueDropdown.toString();
                if (widget.dropDownValue == 'Yes, 1 Dose' ||
                    widget.dropDownValue == 'Si, 1 Dosis' ||
                    widget.dropDownValue == 'Yes, 2 Dose' ||
                    widget.dropDownValue == 'Si, 2 Dosis') {
                  //widget.firstQuestion = true;
                  debugPrint('first true');
                } else {
                  //widget.firstQuestion = false;
                }*/
              });
            },
          ),
        ),
        Visibility(
            visible: false,//widget.firstQuestion,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.025),
                TextWidget(
                  text: "self_t_question_test_drop_down_05",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.2,
                      color: wColor.mapColors["S700"]),
                ),
                SizedBox(height: height * 0.0035),
                MultiSelectedWidget(
                  listItem: vaccinesList,
                  onChanged: (value) {
                    setState(() {
                      if (vacinneChipList.contains(value) != true) {
                        vacinneChipList.add(value.toString());
                      }
                    });
                  },
                  valueDefaultList: "drop_down_select_option",
                  listChip: vacinneChipList,
                  requiredTranslate: false,
                ),
                SizedBox(height: height * 0.028),
                DatePickerContainerWidget(
                  textQuestions: "self_t_question_vissible_5",
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
                  },
                ),
                SizedBox(height: height * 0.028),
                TextWidget(
                  text: "self_t_question_vissible_6",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.2,
                      color: wColor.mapColors["S700"]),
                ),
                SizedBox(height: height * 0.0035),
                MultiSelectedWidget(
                  listItem: dropdownBooster,
                  onChanged: (value) {
                    setState(() {
                      if (dropdownBoosterChipList.contains(value) != true) {
                        dropdownBoosterChipList.add(value.toString());
                      }
                    });
                  },
                  valueDefaultList: "drop_down_select_option",
                  listChip: dropdownBoosterChipList,
                  requiredTranslate: true,
                ),
              ],
            ))
      ],
    );
  }
}
