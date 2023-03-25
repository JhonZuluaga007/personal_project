import 'package:flutter/material.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';

class ContainerStartCounterWidget extends StatelessWidget {
  final String textContainer;
  final String numberPageText;
  final double valueLinear;
  final Widget widgetButton;

  const ContainerStartCounterWidget({
    Key? key,
    required this.numberPageText,
    required this.valueLinear,
    required this.widgetButton,
    required this.textContainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final ScrollController scrollController = ScrollController();
    return Container(
      height: height * 0.23,
      width: width * double.infinity,
      decoration: BoxDecoration(
        color: wColor.mapColors["P01"],
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(height: height * 0.020),
          Text("Step $numberPageText of 6"),
          SizedBox(height: height * 0.0064),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextWidget(
              text: textContainer,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.2,
                  color: wColor.mapColors["S600"]),
            ),
          ),
          SizedBox(height: height * 0.0075),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.095),
            child: LinearProgressIndicator(
              minHeight: 7,
              value: valueLinear,
              valueColor: AlwaysStoppedAnimation(wColor.mapColors["500BASE"]!),
              backgroundColor: wColor.mapColors["T100"],
            ),
          ),
          SizedBox(height: height * 0.021),
          widgetButton
        ]),
      ),
    );
  }
}
