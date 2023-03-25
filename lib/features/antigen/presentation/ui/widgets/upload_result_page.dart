import 'package:flutter/material.dart';
import 'container_start_counter_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/antigen_test_bloc.dart';
import '../../../../../config/theme/theme.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../../common_ui/common_widgets/alerts/show_snackbar.dart';
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
  String _covidQuestionOneValue = "Select option";
  String _covidQuestionTwoValue = "Select option";

  @override
  void initState() {
    final state = BlocProvider.of<AntigenTestBloc>(context).state;
    _covidQuestionOneValue = state.question13!.value.isNotEmpty
        ? state.question13!.value
        : 'Select option';
    _covidQuestionOneValue = state.question14!.value.isNotEmpty
        ? state.question14!.value
        : 'Select option';
    super.initState();
  }

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
          question: antigenBloc.state.question13!.name,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.08,
          listItems: const [
            "Select option",
            "Yes",
            "No",
          ],
          selectedValue: _covidQuestionOneValue,
          width: width,
          onChanged: (covidQuestionOne) {
            if (covidQuestionOne != "Select option") {
              antigenBloc
                  .add(AntigenQuestion13Event(question13: covidQuestionOne!));
              setState(() {
                _covidQuestionOneValue = covidQuestionOne;
              });
            }
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
          question: antigenBloc.state.question14!.name,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.08,
          listItems: const [
            "Select option",
            "Yes",
            "No",
          ],
          selectedValue: _covidQuestionTwoValue,
          width: width,
          onChanged: (covidQuestionTwo) {
            if (covidQuestionTwo != "Select option") {
              antigenBloc
                  .add(AntigenQuestion14Event(question14: covidQuestionTwo!));
              setState(() {
                _covidQuestionTwoValue = covidQuestionTwo;
              });
            }
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
  return BlocBuilder<AntigenTestBloc, AntigenTestState>(
    builder: (context, state) {
      return MainButtonWidget(
          width: width * 0.920,
          height: height * 0.053,
          borderRadiusButton: 30,
          buttonString: "Upload_button_text",
          textColor: wColor.mapColors["P01"],
          buttonColor: validateQuestion(state)
              ? wColor.mapColors["500BASE"]
              : wColor.mapColors["N300"],
          borderColor: validateQuestion(state)
              ? wColor.mapColors["500BASE"]
              : wColor.mapColors["N300"],
          onPressed: () {
            validateQuestion(state)
                ? Navigator.pushNamed(context, 'uploadFinalResult')
                : showSnackBar(
                    context, 'It is mandatory to fill all the fields');
            ;
          });
    },
  );
}

bool validateQuestion(AntigenTestState state) {
  if (state.question13!.value.isNotEmpty &&
      state.question14!.value.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
