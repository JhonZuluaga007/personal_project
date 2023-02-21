import 'package:flutter/material.dart';

import '../widgets/four_question_widget.dart';
import '../../../../../config/theme/theme.dart';
import '../widgets/first_question_vissible_widget.dart';
import '../widgets/container_start_counter_widget.dart';
import '../widgets/second_vissible_question_widget.dart';
import '../widgets/third_vissible_question_widget.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';

class QuestionsAntigenPage extends StatelessWidget {
  const QuestionsAntigenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    return MyAppScaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: wColor.mapColors["S800"],
          ),
        ),
        centerTitle: true,
        title: TextWidget(
          text: "test_info_screen_text_one",
          style: TextStyle(
              fontSize: 20,
              color: wColor.mapColors["S800"],
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2),
        ),
        backgroundColor: wColor.mapColors["P01"],
        elevation: 4,
      ),
      bottomNavigationBar: ContainerStartCounterWidget(
          numberPageText: "2",
          valueLinear: 0.34,
          widgetButton: buttonContinue(context),
          textContainer: "self_t_linear_text"),
      children: [
        SizedBox(height: height * 0.02),
        const FirstVissibleQuestionWidget(),
        SizedBox(height: height * 0.015),
        const SecondVissibleQuestionWidget(),
        SizedBox(height: height * 0.015),
        const ThirdVissibleQuestionWidget(),
        SizedBox(height: height * 0.015),
        const FourQuestionWidget()
      ],
    );
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
          Navigator.pushNamed(context, "instructionPage");
        });
  }
}
