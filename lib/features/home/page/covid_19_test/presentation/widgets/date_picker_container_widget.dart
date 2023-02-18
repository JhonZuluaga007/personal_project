import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';

import '../../../../../../config/theme/theme.dart';
import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';

class DatePickerContainerWidget extends StatefulWidget {
  final String textQuestions;
  final DateTime date;
  final Function() onTap;

  const DatePickerContainerWidget({
    super.key,
    required this.textQuestions, 
    required this.onTap, 
    required this.date,
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
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: wColor.mapColors["S700"],
              letterSpacing: -0.2),
        ),
        SizedBox(height: height * 0.0043),
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: width * 0.922,
            height: height * 0.06,
            decoration: BoxDecoration(
              color: wColor.mapColors["P01"],
              border: Border(
                top: BorderSide(width: 1, color: wColor.mapColors["IDGrey"]!),
                bottom:
                    BorderSide(width: 1, color: wColor.mapColors["IDGrey"]!),
                right: BorderSide(width: 1, color: wColor.mapColors["IDGrey"]!),
                left: BorderSide(width: 1, color: wColor.mapColors["IDGrey"]!),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.037),
              child: Row(
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
