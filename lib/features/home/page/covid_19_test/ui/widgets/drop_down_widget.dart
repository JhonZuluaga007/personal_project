import 'package:flutter/material.dart';

import 'package:personal_project/app_localizations.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';

import '../../../../../../config/theme/theme.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> dropDownItem;
  final String textQuestion;
  final Widget? iconWidget;
  final double width;
  final double? heightSizedBoxText;
  String dropDownValue = "Yes";
  final TextStyle? dropTextStyle;

  DropDownWidget({
    Key? key,
    required this.dropDownItem,
    required this.textQuestion,
    this.iconWidget,
    required this.width,
    this.heightSizedBoxText,
    required this.dropDownValue,
    this.dropTextStyle,
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.039),
          child: TextWidget(
            text: widget.textQuestion,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.2,
                color: wColor.mapColors["S700"]),
          ),
        ),
        SizedBox(height: widget.heightSizedBoxText ?? height * 0.0045),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.039),
          child: SizedBox(
            width: width,
            height: height * 0.060,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                          width: 1, color: wColor.mapColors["T100"]!))),
              items: widget.dropDownItem
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: AppLocalizations.of(context)!.translate(value),
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.028),
                      child: TextWidget(
                        textAlign: TextAlign.center,
                        text: value,
                        style: widget.dropTextStyle ??
                            TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.2,
                                color: wColor.mapColors["S600"]),
                      ),
                    ));
              }).toList(),
              hint: Padding(
                padding: EdgeInsets.only(left: width * 0.028),
                child: Text(
                  widget.dropDownValue,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.2,
                      color: wColor.mapColors["S600"]),
                ),
              ),
              icon: widget.iconWidget,
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
                  widget.dropDownValue = valueDropdown.toString();
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
