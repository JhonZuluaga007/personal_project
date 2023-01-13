import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/features/covid_19_test/ui/widgets/drop_down_widget.dart';
import 'package:personal_project/icons/icons.dart';

import '../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../config/theme/theme.dart';
import '../widgets/container_start_counter_widget.dart';
import '../widgets/date_picker_container_widget.dart';

class TQuestionsPage extends StatelessWidget {

  final double valueLinear;

  const TQuestionsPage({
    super.key, 
    this.valueLinear = 0.4, 
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    int maxValueLinear = 5;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: wColor.mapColors["S800"],
            ),
          ),
          title: TextWidget(
            text: "text_general_covid_19_test",
            style: TextStyle(
              fontSize: 20,
              color: wColor.mapColors["S800"],
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2
            ),
          ),
          backgroundColor: wColor.mapColors["P01"],
          elevation: 4,
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.17,),
            Stack(
              children: [
                DropDownWidget(
                  dropDownItem: const [
                    "self_t__drop_down_text",
                    "self_t_drop_down_text_1"
                  ], 
                  width: width * 0.922, 
                  heightSizedBoxText: height * 0.0116,
                  textQuestion: "self_t_question_test_drop_down_00", 
                  dropDownValue: "Yes",
                  iconWidget: Padding(
                    padding: EdgeInsets.only(right: width * 0.045),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 18,
                      color: wColor.mapColors["Black"],
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.90,
                  top: height * 0.021,
                  child: Image.asset(IconsFolderCovid.infoCircleDropDown)
                ),
              ]
            ),
            SizedBox(height: height * 0.031),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.037),
              child: const DatePickerContainerWidget(
                textQuestions: "self_t_question_test_drop_down_01"
              ),
            ),
            SizedBox(height: height * 0.028),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.037),
              child: const DatePickerContainerWidget(
                textQuestions: "self_t_question_test_drop_down_02"
              ),
            ),
            SizedBox(height: height * 0.053),
            DropDownWidget(
              dropDownItem: const [
                "self_t__drop_down_text_2",
                "self_t__drop_down_text_3",
                "self_t__drop_down_text_4",
              ], 
              width: width * 0.922, 
              heightSizedBoxText: height * 0.0043,
              textQuestion: "self_t_question_test_drop_down_03", 
              dropDownValue: "Yes, 1 Dose",
              iconWidget: Padding(
                padding: EdgeInsets.only(right: width * 0.0431),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: wColor.mapColors["Black"],
                ),
              ),
            ),
            SizedBox(height: height * 0.053),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.037),
              child: const DatePickerContainerWidget(
                textQuestions: "self_t_question_test_drop_down_04"
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ContainerStartCounterWidget(
        numberPageText: "2", 
        valueLinear: valueLinear, 
        widgetButton: buttonContinue(context), 
        textContainer: "self_t_linear_text"
      ),
    );
  }
}

Widget buttonContinue(BuildContext context){
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
    onPressed: (){
      Navigator.pushNamed(context, "instructionPage");
    }
  );
}