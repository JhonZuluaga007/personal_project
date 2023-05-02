import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

import '../bloc/pcr_bloc.dart';
import '../../../../config/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/widget/test_widgets/app_bar_widget.dart';
import '../../../../config/helpers/form_submission_status.dart';
import '../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../common_ui/common_widgets/buttons/button_widget.dart';
import '../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../medical_history/presentation/widgets/done_alert_widget.dart';
import '../../../medical_history/presentation/widgets/error_alert_widget.dart';
import '../../../../common_ui/common_widgets/text_field/text_field_with_border_widget.dart';

class PcrRegisterPage extends StatefulWidget {
  const PcrRegisterPage({super.key, this.isHomeNavigation});

  final bool? isHomeNavigation;

  @override
  State<PcrRegisterPage> createState() => _PcrRegisterPageState();
}

class _PcrRegisterPageState extends State<PcrRegisterPage> {
  final TextEditingController pcrIdController = TextEditingController();
  String qrCode = '';
  ScanController scanController = ScanController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

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
      }, 'test_info_screen_text_two'),
      children: [
        SizedBox(height: size.height * 0.05),
        const TextWidget(
          text: 'pcr_test_text_one',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.025),
        SizedBox(
          height: size.height * 0.15,
          child: Image.asset(
            'assets/images/PrincipalBanner.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(height: size.height * 0.05),
        SizedBox(height: size.height * 0.015),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: 'pcr_test_text_four',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: size.height * 0.025),
            TextFieldWithBorderWidget(
              height: height * 0.12,
              requiresTranslate: true,
              textEditingController: pcrIdController,
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
            SizedBox(height: size.height * 0.015),
            const TextWidget(
              text: 'pcr_test_text_two',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: size.height * 0.015),
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
                                          String newValue =
                                              value.split('=').last;
                                          pcrIdController.text = newValue;
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )));
                }),
            SizedBox(height: size.height * 0.15),
            BlocConsumer<PcrBloc, PcrState>(
              listener: (context, state) {
                if (state.formStatus is SubmissionSuccess) {
                  doneSendInfo(
                    context: context,
                    requiresTranslateText: true,
                    mainIcon: Icon(
                      Icons.check,
                      size: height * 0.15,
                      color: wColor.mapColors['C00'],
                    ),
                    titleText: 'alert_text_one',
                    paddingHeight: height * 0.22,
                    infoText: 'alert_text_pcr_success',
                    mainButton: 'alert_text_three',
                    mainButtonFunction: () {
                      navigationBloc.add(PageChanged(indexNavigation: 1));
                      Navigator.pushNamed(context, 'navBar');
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
                      infoText: state.errorMessage!,
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
                      buttonString: "self_t_button",
                      textColor: wColor.mapColors["P01"],
                      buttonColor: wColor.mapColors["500BASE"],
                      borderColor: wColor.mapColors["500BASE"],
                      onPressed: () async {
                        if (pcrIdController.text.isNotEmpty) {
                          if ((pcrIdController.text.startsWith('R') ||
                                  pcrIdController.text.startsWith('r')) &&
                              pcrIdController.text.length == 10) {
                            BlocProvider.of<PcrBloc>(context)
                                .add(PcrValidateEvent(
                              project: "ChelseaProject",
                              code: pcrIdController.text,
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
                                infoText: 'Please provide a valid PCR code',
                                mainButton: 'alert_text_error_three',
                                mainButtonFunction: () {
                                  Navigator.pop(context);
                                });
                          }
                        }
                      });
                }
              },
            )
          ],
        )
      ],
    );
  }
}
