import 'package:flutter/material.dart';

import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/features/auth/domain/entities/helper_tools_entity.dart';

import '../../../../../../config/theme/theme.dart';

class DropDownQuestionsWidget extends StatefulWidget {
  final List<OpDropdown> dropDownItem;
  final String textQuestion;
  final Widget? iconWidget;
  final double width;
  final double? heightSizedBoxText;
  String dropDownValue = "Yes";
  final TextStyle? dropTextStyle;
  String? selectedString;
  bool? firstQuestion;
  final Function(OpDropdown?)? onChanged;
  DropDownQuestionsWidget(
      {Key? key,
      required this.dropDownItem,
      required this.textQuestion,
      this.iconWidget,
      required this.width,
      this.heightSizedBoxText,
      this.selectedString,
      this.onChanged,
      required this.dropDownValue,
      this.dropTextStyle,
      this.firstQuestion})
      : super(key: key);

  @override
  State<DropDownQuestionsWidget> createState() =>
      _DropDownQuestionsWidgetState();
}

class _DropDownQuestionsWidgetState extends State<DropDownQuestionsWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: widget.textQuestion,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
              color: wColor.mapColors["S700"]),
        ),
        SizedBox(height: widget.heightSizedBoxText ?? height * 0.0035),
        SizedBox(
          width: width,
          height: height * 0.06,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 1,
                        color: wColor.mapColors["IDGrey"]!))),
            items: widget.dropDownItem
                .map<DropdownMenuItem<OpDropdown>>((OpDropdown value) {
              return DropdownMenuItem<OpDropdown>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.01),
                    child: TextWidget(
                      requiresTranslate: false,
                      textAlign: TextAlign.center,
                      text: value.valor,
                      style: widget.dropTextStyle ??
                          TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.2,
                              color: wColor.mapColors["S600"]),
                    ),
                  ));
            }).toList(),
            hint: Text(
              widget.dropDownValue,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.2,
                  color: wColor.mapColors["S600"]),
            ),
            icon: const Icon(Icons.arrow_downward),
            iconSize: 16,
            borderRadius: BorderRadius.circular(5),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.2,
                color: wColor.mapColors["S600"]),
            dropdownColor: wColor.mapColors["P01"],
            onChanged: widget.onChanged ??
                (valueDropdown) {
                  setState(() {
                    widget.dropDownValue = valueDropdown.toString();
                    widget.selectedString = valueDropdown.toString();
                    print(widget.selectedString);
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
      ],
    );
  }
}
