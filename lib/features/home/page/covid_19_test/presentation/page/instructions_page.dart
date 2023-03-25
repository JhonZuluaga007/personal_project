import 'package:flutter/material.dart';

import '../../../../../../config/theme/theme.dart';
import '../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../../antigen/presentation/ui/widgets/container_start_counter_widget.dart';

class InstructionsPage extends StatelessWidget {
  final double valueLinear;

  const InstructionsPage({super.key, this.valueLinear = 0.51});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "selfTestQuestions");
          },
          icon: Icon(
            Icons.arrow_back,
            color: wColor.mapColors["S800"],
          ),
        ),
        centerTitle: true,
        title: TextWidget(
          text: "test_part_one_text",
          style: TextStyle(
              fontSize: 20,
              color: wColor.mapColors["S800"],
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2),
        ),
        backgroundColor: wColor.mapColors["P01"],
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.1),
            const Center(
                child: Image(
                    image: AssetImage(
                        "assets/images/image_instructions_page.png"))),
            SizedBox(height: height * 0.053),
            TextWidget(
              text: "instructions_title_text",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: wColor.mapColors["S800"],
                  letterSpacing: -0.2),
            ),
            SizedBox(height: height * 0.029),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextWidget(
                text: "instructions_description_text",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: wColor.mapColors["S600"],
                    letterSpacing: -0.2),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ContainerStartCounterWidget(
          numberPageText: "3",
          valueLinear: valueLinear,
          widgetButton: buttonContinue(context),
          textContainer: "instructions_linear_text"),
    );
  }
}

Widget buttonContinue(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final wColor = ThemesIdx20();

  return MainButtonWidget(
      width: width * 0.920,
      height: height * 0.053,
      borderRadiusButton: 30,
      buttonString: "self_t_button",
      textColor: wColor.mapColors["P01"],
      buttonColor: wColor.mapColors["500BASE"],
      borderColor: wColor.mapColors["500BASE"],
      onPressed: () {
        Navigator.pushNamed(context, "startCounter");
      });
}
