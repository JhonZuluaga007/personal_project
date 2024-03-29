import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/theme/theme.dart';
import '../widgets/image_buttons_upload_widget.dart';
import '../../../../../../config/helpers/form_submission_status.dart';
import '../../../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';
import '../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../common_ui/common_widgets/alerts/show_snackbar.dart';
import '../../../../../medical_history/presentation/widgets/done_alert_widget.dart';
import '../../../../../../common_ui/common_widgets/form_field_dropdown_widget.dart';
import '../../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../../medical_history/presentation/widgets/error_alert_widget.dart';
import '../../../../../antigen/presentation/ui/widgets/container_start_counter_widget.dart';

class UploadFinalResultPage extends StatefulWidget {
  final double valueLinear;
  final int maxValueLinear;

  const UploadFinalResultPage(
      {super.key, this.valueLinear = 1, this.maxValueLinear = 6});

  @override
  State<UploadFinalResultPage> createState() => _UploadFinalResultPageState();
}

class _UploadFinalResultPageState extends State<UploadFinalResultPage> {
  String _covidQuestionThreeValue = "Select option";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
    final width = MediaQuery.of(context).size.width;

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
              SizedBox(height: height * 0.015),
              const ImageButtonsWidget(),
              SizedBox(height: height * 0.015),
              FormFieldDropdownWidget(
                question: antigenBloc.state.question15!.name,
                generalColor: wColor.mapColors["S700"]!,
                height: height * 0.11,
                listItems: const [
                  "Select option",
                  "Yes",
                  "No",
                ],
                selectedValue: _covidQuestionThreeValue,
                width: width,
                onChanged: (covidQuestionThree) {
                  if (covidQuestionThree != "Select option") {
                    antigenBloc.add(AntigenQuestion15Event(
                        question15: covidQuestionThree!));
                    setState(() {
                      _covidQuestionThreeValue = covidQuestionThree;
                    });
                  }
                },
              ),
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

  return BlocConsumer<AntigenTestBloc, AntigenTestState>(
    listener: (context, state) {
      if (state.formStatus is SubmissionSuccess) {
        doneSendInfo(
          requiresTranslateText: false,
          context: context,
          mainIcon: Icon(
            Icons.check,
            size: height * 0.15,
            color: wColor.mapColors['C00'],
          ),
          titleText: 'alert_text_one',
          paddingHeight: height * 0.22,
          infoText: state.message,
          mainButton: 'alert_text_three',
          mainButtonFunction: () {
            if (state.question15!.value == "Yes") {
              navigationBloc.add(PageChanged(indexNavigation: 2));

              Navigator.pushNamedAndRemoveUntil(
                  context, 'navBar', (route) => false);
            } else {
              navigationBloc.add(PageChanged(indexNavigation: 1));
              Navigator.pushNamedAndRemoveUntil(
                  context, 'navBar', (route) => false);
            }
          },
        );
      } else if (state.formStatus is SubmissionFailed) {
        errorAlertInfoPop(
            context: context,
            mainIcon: Icon(
              Icons.cancel,
              color: wColor.mapColors['C01'],
              size: 46,
            ),
            titleText: 'alert_text_error_one',
            paddingHeight: height * 0.22,
            infoText: state.errorMessage,
            mainButton: 'alert_text_error_three',
            mainButtonFunction: () {
              Navigator.pop(context);
            });
      }
    },
    builder: (context, state) {
      if (state.formStatus is FormSubmitting) {
        return const Center(child: CircularProgressIndicator());
      } else {
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
                  ? BlocProvider.of<AntigenTestBloc>(context)
                      .add(AntigenRegisterEvent())
                  : showSnackBar(
                      context, 'It is mandatory to fill all the fields');
            });
      }
    },
  );
}

bool validateQuestion(AntigenTestState state) {
  if (state.question15!.value.isNotEmpty && state.testImage.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
