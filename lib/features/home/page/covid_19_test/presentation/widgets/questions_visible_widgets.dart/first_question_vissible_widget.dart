import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/features/antigen/presentation/bloc/antigen_test_bloc.dart';
import 'package:personal_project/features/medical_history/presentation/widgets/multi_selected_widget.dart';

import '../../../../../../../app_localizations.dart';
import '../../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../../config/theme/theme.dart';
import '../date_picker_container_widget.dart';

class FirstVissibleQuestionWidget extends StatefulWidget {
  const FirstVissibleQuestionWidget(
      {Key? key})
      : super(key: key);
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

  late DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: "self_t_question_test_drop_down_00",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
              color: wColor.mapColors["S700"]),
        ),
        SizedBox(
            height:height * 0.0025),
        SizedBox(
          width: width,
          height: height * 0.07,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        width: 1, color: wColor.mapColors["IDGrey"]!))),
            items: dropdownItem.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: AppLocalizations.of(context)!.translate(value),
                  child: Padding(
                    padding: EdgeInsets.only(left:width * 0.028),
                    child: TextWidget(
                      textAlign: TextAlign.center,
                      text: value,
                      style:
                          // widget.dropTextStyle ??
                          TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.2,
                              color: wColor.mapColors["S600"]),
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
                  color: wColor.mapColors["S600"]),
            ),
            icon: const Icon(Icons.arrow_downward),
            // widget.iconWidget,
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
                //widget.dropDownValue = valueDropdown!;
                /*if (widget.dropDownValue == 'Yes' ||
                    widget.dropDownValue == 'Si') {
                  //widget.firstQuestion = true;
                } else {
                  //widget.firstQuestion = false;
                }*/

              });
                //antigenBloc.add(AntigenQuestion1Event(question1: widget.dropDownValue));
            },
          ),
        ),
        Visibility(
            visible: false,
            child: Column(
              children: [
                SizedBox(height: height * 0.031),
                MultiSelectedWidget(
                  listItem: firstQuestion,
                  onChanged: (value) {
                    setState(() {
                      if (firstQuestionChipLIst.contains(value) != true) {
                        firstQuestionChipLIst.add(value.toString());
                      }
                    });
                    //antigenBloc.add(AntigenQuestion2Event(
                    //    question2: firstQuestionChipLIst));
                  },
                  valueDefaultList: "drop_down_select_option",
                  listChip: firstQuestionChipLIst,
                  requiredTranslate: true,
                ),
                SizedBox(height: height * 0.028),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: width * 0.037),
                  child: DatePickerContainerWidget(
                    textQuestions: "self_t_question_test_drop_down_02",
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

                      //antigenBloc
                      //    .add(AntigenQuestion3DateEvent(question3: newDate));
                    },
                    date: date,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
