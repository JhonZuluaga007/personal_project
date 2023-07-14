import 'package:flutter/material.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';

class DatePickerContainerWidget extends StatefulWidget {
  final String textQuestions;
  final DateTime date;
  final Function() onTap;
  final Color? colorBorder;
  final Color? colorIcon;
  final double? radiusBorderInput;

  const DatePickerContainerWidget({
    super.key,
    required this.textQuestions,
    required this.onTap,
    required this.date,
    this.colorBorder,
    this.radiusBorderInput,
    this.colorIcon,
  });

  @override
  State<DatePickerContainerWidget> createState() =>
      _DatePickerContainerWidgetState();
}

class _DatePickerContainerWidgetState extends State<DatePickerContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: widget.textQuestions,
          requiresTranslate: false,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: wColor.mapColors["S700"],
              letterSpacing: -0.2),
        ),
        SizedBox(height: height * 0.007),
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: width * 0.922,
            height: height * 0.07,
            decoration: BoxDecoration(
                color: wColor.mapColors["P01"],
                borderRadius:
                    BorderRadius.circular(widget.radiusBorderInput ?? 4),
                border: Border.all(
                    color: widget.colorBorder ?? wColor.mapColors['Black']!)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.037),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: width * 0.01),
                  TextWidget(
                    text: "Select date",
                    requiresTranslate: false,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: wColor.mapColors['IDGrey'],
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: width * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.date.day}/${widget.date.month}/${widget.date.year}",
                        style: TextStyle(
                            color: wColor.mapColors["S600"],
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: -0.2),
                      ),
                      Icon(
                        Icons.calendar_today,
                        size: 18,
                        color: widget.colorIcon ?? wColor.mapColors["Black"],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
