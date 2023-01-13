import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';

import '../../../../../../config/theme/theme.dart';

class DatePickerContainerWidget extends StatefulWidget {
  final String textQuestions;

  const DatePickerContainerWidget({
    super.key,
    required this.textQuestions,
  });

  @override
  State<DatePickerContainerWidget> createState() =>
      _DatePickerContainerWidgetState();
}

class _DatePickerContainerWidgetState extends State<DatePickerContainerWidget> {
  DateTime date = DateTime.now();

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
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: wColor.mapColors["S700"],
              letterSpacing: -0.2),
        ),
        SizedBox(height: height * 0.0043),
        GestureDetector(
          onTap: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2010),
                lastDate: DateTime(3000));

            if (newDate == null) return;

            setState(() => date = newDate);
          },
          child: Container(
            width: width * 0.922,
            height: height * 0.06,
            decoration: BoxDecoration(
              color: wColor.mapColors["P01"],
              border: Border(
                top: BorderSide(width: 1, color: wColor.mapColors["T100"]!),
                bottom: BorderSide(width: 1, color: wColor.mapColors["T100"]!),
                right: BorderSide(width: 1, color: wColor.mapColors["T100"]!),
                left: BorderSide(width: 1, color: wColor.mapColors["T100"]!),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.037),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${date.day}/${date.month}/${date.year}",
                    style: TextStyle(
                        color: wColor.mapColors["S600"],
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: -0.2),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18,
                    color: wColor.mapColors["Black"],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
