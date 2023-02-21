import 'package:flutter/material.dart';
import 'container_start_counter_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/antigen_test_bloc.dart';
import '../../../../../config/theme/theme.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../../common_ui/common_widgets/buttons/button_widget.dart';
import '../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../../common_ui/common_widgets/form_field_dropdown_widget.dart';

class UploadResultPage extends StatefulWidget {
  final double valueLinear;
  final int maxValueLinear;

  const UploadResultPage(
      {super.key, this.valueLinear = 0.85, this.maxValueLinear = 5});

  @override
  State<UploadResultPage> createState() => _UploadResultPageState();
}

class _UploadResultPageState extends State<UploadResultPage> {
  String _covidQuestionOneValue = "";
  String _covidQuestionTwoValue = "";
  String _covidQuestionThreeValue = "";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);

    return MyAppScaffold(
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
      bottomNavigationBar: ContainerStartCounterWidget(
          numberPageText: "5",
          valueLinear: widget.valueLinear,
          widgetButton: buttonUpload(context),
          textContainer: "Upload_linear_text"),
      children: [
        SizedBox(height: height * 0.02),
        FormFieldDropdownWidget(
          question: antigenBloc.state.question13!.name!,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.08,
          listItems: const [
            "",
            "Yes",
            "No",
          ],
          selectedValue: _covidQuestionOneValue,
          width: width,
          onChanged: (covidQuestionTwo) {
            antigenBloc
                .add(AntigenQuestion13Event(question13: covidQuestionTwo!));
            setState(() {
              _covidQuestionOneValue = covidQuestionTwo;
            });
          },
        ),
        SizedBox(
          height: height * 0.2,
          width: width * 0.9,
          child: Image.asset(
            'assets/images/cimage.png',
            fit: BoxFit.contain,
          ),
        ),
        FormFieldDropdownWidget(
          question: antigenBloc.state.question14!.name!,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.08,
          listItems: const [
            "",
            "Yes",
            "No",
          ],
          selectedValue: _covidQuestionTwoValue,
          width: width,
          onChanged: (covidQuestionTwo) {
            antigenBloc
                .add(AntigenQuestion14Event(question14: covidQuestionTwo!));
            setState(() {
              _covidQuestionTwoValue = covidQuestionTwo;
            });
          },
        ),
        SizedBox(
          height: height * 0.2,
          width: width * 0.95,
          child: Image.asset(
            'assets/images/timage.png',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: height * 0.05),
      ],
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
