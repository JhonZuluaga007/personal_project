import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';

class TextColumnMedicalHistoryWidget extends StatelessWidget {
  const TextColumnMedicalHistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wColor = ThemesIdx20();
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.05),
        TextWidget(
          text: "medical_history_title",
          style: TextStyle(
              fontSize: 20,
              color: wColor.mapColors["S800"],
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2),
        ),
        SizedBox(height: size.height * 0.025),
        TextWidget(
          text: "medical_history_text_one",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 16,
              color: wColor.mapColors["S800"],
              fontWeight: FontWeight.w400,
              letterSpacing: -0.2),
        ),
        SizedBox(height: size.height * 0.025),
        TextWidget(
          text: "medical_history_text_two",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 20,
              color: wColor.mapColors["S800"],
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2),
        ),
        SizedBox(height: size.height * 0.02),
        TextWidget(
          text: "medical_history_text_three",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 16,
              color: wColor.mapColors["S800"],
              fontWeight: FontWeight.w400,
              letterSpacing: -0.2),
        ),
        SizedBox(height: size.height * 0.02),
      ],
    );
  }
}
