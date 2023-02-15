import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/main_button_widget.dart';

import '../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../config/theme/theme.dart';
import '../../../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../widgets/container_start_counter_widget.dart';
import '../widgets/image_buttons_upload_widget.dart';

class UploadFinalResultPage extends StatefulWidget {
  final double valueLinear;
  final int maxValueLinear;

  const UploadFinalResultPage(
      {super.key, this.valueLinear = 1, this.maxValueLinear = 6});

  @override
  State<UploadFinalResultPage> createState() => _UploadFinalResultPageState();
}

class _UploadFinalResultPageState extends State<UploadFinalResultPage> {
  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: height * 0.025),
              TextWidget(
                text: "Upload_question_test_02",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                    color: wColor.mapColors["S800"]),
              ),
              SizedBox(height: height * 0.075),
              const ImageButtonsWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: ContainerStartCounterWidget(
          numberPageText: "6",
          valueLinear: widget.valueLinear,
          widgetButton: buttonUpload(context),
          textContainer: "Upload_linear_text"),
    );
  }
}

Widget buttonUpload(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final wColor = ThemesIdx20();
  NavigationBarBloc navigationBloc =
      BlocProvider.of<NavigationBarBloc>(context);

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
        navigationBloc.add(PageChanged(indexNavigation: 0));
        Navigator.pushNamed(context, 'navBar');
      });
}
