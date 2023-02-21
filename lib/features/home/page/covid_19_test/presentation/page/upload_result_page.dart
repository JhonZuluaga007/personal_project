import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/button_widget.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/main_button_widget.dart';

import '../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../config/theme/theme.dart';
import '../../../../../antigen/presentation/ui/widgets/container_start_counter_widget.dart';
import '../../../../../antigen/presentation/ui/widgets/drop_down_questions_widget.dart';

class UploadResultPage extends StatelessWidget {
  final double valueLinear;
  final int maxValueLinear;

  const UploadResultPage(
      {super.key, this.valueLinear = 0.85, this.maxValueLinear = 5});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: wColor.mapColors["S800"],
          onPressed: () {
            Navigator.pop(context, "startCounter");
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              /*DropDownQuestionsWidget(
                dropDownItem: const [
                  "Upload_drop_down_0",
                  "Upload_drop_down_1"
                ],
                dropDownValue: "Selected",
                textQuestion: "Upload_question_test_0",
                width: width * 0.922,
                iconWidget: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                  size: 15,
                ),
              ),
              SizedBox(height: height * 0.039),
              DropDownQuestionsWidget(
                dropDownItem: const [
                  "Upload_drop_down_0",
                  "Upload_drop_down_1"
                ],
                dropDownValue: "Selected",
                textQuestion: "Upload_question_test_01",
                width: width * 0.922,
                iconWidget: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                  size: 15,
                ),
              ),*/
              SizedBox(height: height * 0.069),
              //TODO GRAPHIC IMAGE, while we get the needed
              SizedBox(
                height: height * 0.2,
                width: width * 0.8,
                child: Image.asset(
                  'assets/images/PrincipalBanner.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              // TextWidget(
              //   text: "Upload_question_test_02",
              //   style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w600,
              //       letterSpacing: -0.2,
              //       color: wColor.mapColors["S800"]),
              // ),
              SizedBox(height: height * 0.075),
              // buttonImagePicture(context)
            ],
          ),
        ),
      ),
      bottomNavigationBar: ContainerStartCounterWidget(
          numberPageText: "5",
          valueLinear: valueLinear,
          widgetButton: buttonUpload(context),
          textContainer: "Upload_linear_text"),
    );
  }
}

Widget buttonUpload(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final wColor = ThemesIdx20();
  return MainButtonWidget(
      width: width * 0.920,
      height: height * 0.053,
      borderRadiusButton: 30,
      buttonString: "Upload_button_text",
      textColor: wColor.mapColors["P01"],
      buttonColor: wColor.mapColors["500BASE"],
      borderColor: wColor.mapColors["500BASE"],
      onPressed: () {
        //TODO CHECK RESULT AND SEND POPUP OF SUCCESS

        Navigator.pushNamed(context, 'uploadFinalResult');
      });
}

Widget buttonImagePicture(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final wColor = ThemesIdx20();

  return Column(
    children: [
      ButtonWidget(
          width: width * 0.920,
          height: height * 0.053,
          borderRadiusButton: 30,
          icon: Icons.file_upload_outlined,
          iconColor: wColor.mapColors["S800"],
          buttonString: "Upload_image_Button_text",
          textColor: wColor.mapColors["S800"],
          buttonColor: wColor.mapColors["P01"],
          borderColor: wColor.mapColors["S800"],
          onPressed: () {}),
      SizedBox(height: height * 0.021),
      ButtonWidget(
          width: width * 0.920,
          height: height * 0.053,
          borderRadiusButton: 30,
          icon: Icons.camera_alt_outlined,
          iconColor: wColor.mapColors["S800"],
          buttonString: "Upload_picture_Button_text",
          textColor: wColor.mapColors["S800"],
          buttonColor: wColor.mapColors["P01"],
          borderColor: wColor.mapColors["S800"],
          onPressed: () {}),
    ],
  );
}
