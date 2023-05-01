import 'package:scan/scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localizations.dart';
import 'questions_antigen_page.dart';
import '../../bloc/antigen_test_bloc.dart';
import '../../../../../config/theme/theme.dart';
import '../widgets/container_start_counter_widget.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../home/widget/test_widgets/app_bar_widget.dart';
import '../../../../../config/helpers/form_submission_status.dart';
import '../../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../../common_ui/common_widgets/buttons/button_widget.dart';
import '../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../medical_history/presentation/widgets/error_alert_widget.dart';
import '../../../../../common_ui/common_widgets/text_field/text_field_with_border_widget.dart';

class AntigenRegisterInfoPage extends StatefulWidget {
  const AntigenRegisterInfoPage(
      {super.key, this.isHomeNavigation, this.valueLinear = 0.17});
  final double valueLinear;

  final bool? isHomeNavigation;

  @override
  State<AntigenRegisterInfoPage> createState() =>
      _AntigenRegisterInfoPageState();
}

class _AntigenRegisterInfoPageState extends State<AntigenRegisterInfoPage> {
  final TextEditingController testIdController = TextEditingController();
  String qrCode = '';
  ScanController scanController = ScanController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
        final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);
    return MyAppScaffold(
      crossAxisAlignment: CrossAxisAlignment.start,
      appBar: registerAppBarWidget(() {
        if (widget.isHomeNavigation == true) {
          navigationBloc.add(PageChanged(indexNavigation: 0));
          Navigator.pushNamed(context, 'navBar');
        }
        if (widget.isHomeNavigation == false) {
          navigationBloc.add(PageChanged(indexNavigation: 2));
          Navigator.pushNamed(context, 'navBar');
        }
      }, 'test_info_screen_text_one'),
      bottomNavigationBar: ContainerStartCounterWidget(
          numberPageText: "1",
          valueLinear: widget.valueLinear,
          widgetButton: buttonContinuePartOne(context),
          textContainer: "test_part_one_text"),
      children: [
        SizedBox(height: size.height * 0.05),
        const TextWidget(
          text: 'test_info_screen_text_title',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.05),
        Center(
          child: SizedBox(
            height: size.height * 0.22,
            width: size.width * 0.7,
            child: Image.asset(
              'assets/images/onboarding_2.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const TextWidget(
                  text: 'antigen_test_step_one_text_label',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(width: size.width * 0.01),
                Tooltip(
                  message: AppLocalizations.of(context)!
                      .translate('antigen_tooltip'),
                  triggerMode: TooltipTriggerMode.tap,
                  child: Icon(
                    Icons.question_mark,
                    size: 16,
                    color: wColor.mapColors['IDPink'],
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.015),
            TextFieldWithBorderWidget(
              textEditingController: testIdController,
              requiresTranslate: true,
              textInputType: TextInputType.text,
              borderColor: wColor.mapColors["T100"],
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: wColor.mapColors["S600"]),
              hintText: "antigen_test_step_one_text_hint",
              textStyle: const TextStyle(fontSize: 18),
              widthBorder: 3,
            ),
            SizedBox(height: size.height * 0.035),
            ButtonWidget(
                icon: Icons.qr_code_scanner,
                iconColor: Colors.black,
                buttonColor: Colors.white,
                borderColor: Colors.black,
                textColor: Colors.black,
                buttonString: 'test_part_one_text',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyAppScaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            leading: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          children: [
                            Center(
                              child: Container(
                                height: height * 0.8,
                                width: width,
                                child: ScanView(
                                  controller: scanController,
                                  scanAreaScale: .7,
                                  onCapture: (value) {
                                    String newValue = value.split('=').last;
                                    testIdController.text = newValue;
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                })
          ],
        )
      ],
    );
  }

  Widget buttonContinuePartOne(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final userState = BlocProvider.of<AuthBloc>(context).state;
    return BlocConsumer<AntigenTestBloc, AntigenTestState>(
      listener: (BuildContext context, state) {
        if (state.formStatus is SubmissionSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const QuestionsAntigenPage()),
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
      builder: (BuildContext context, state) {
        if (state.formStatus is FormSubmitting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return MainButtonWidget(
              width: width * 0.920,
              height: height * 0.053,
              borderRadiusButton: 30,
              buttonString: "self_t_button",
              textColor: wColor.mapColors["P01"],
              buttonColor: wColor.mapColors["500BASE"],
              borderColor: wColor.mapColors["500BASE"],
              onPressed: () {
                if (testIdController.text.isEmpty) {
                  return;
                }
                if ((testIdController.text.startsWith('A') ||
                        testIdController.text.startsWith('a')) &&
                    testIdController.text.length == 10) {
                  BlocProvider.of<AntigenTestBloc>(context)
                      .add(AntigenValidateEvent(
                    userId: userState.userId!,
                    code: testIdController.text,
                  ));
                } else {
                  errorAlertInfoPop(
                      context: context,
                      mainIcon: Icon(
                        Icons.cancel,
                        color: wColor.mapColors['C01'],
                        size: 46,
                      ),
                      titleText: 'alert_text_error_one',
                      paddingHeight: height * 0.22,
                      infoText: 'Please provide a valid Antigen code',
                      mainButton: 'alert_text_error_three',
                      mainButtonFunction: () {
                        Navigator.pop(context);
                      });
                }
              });
        }
      },
    );
  }
}
