import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:personal_project/common_ui/common_widgets/qr/service_qr_widget.dart';
import 'package:personal_project/features/pcr/data/data_source/pcr_data_source.dart';
import '../../../../common_ui/common_widgets/buttons/button_widget.dart';
import '../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import '../../../../config/theme/theme.dart';
import '../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../../auth/bloc/auth_bloc.dart';
import '../../../home/widget/test_widgets/app_bar_widget.dart';
import '../../../medical_history/presentation/widgets/done_alert_widget.dart';
import '../../../medical_history/presentation/widgets/error_alert_widget.dart';

class PcrRegisterPage extends StatefulWidget {
  const PcrRegisterPage({super.key, this.isHomeNavigation});

  final bool? isHomeNavigation;

  @override
  State<PcrRegisterPage> createState() => _PcrRegisterPageState();
}

class _PcrRegisterPageState extends State<PcrRegisterPage> {
  final TextEditingController pcrIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final userState = BlocProvider.of<AuthBloc>(context).state;

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

        // Row(
        //   children: [
        //     const TextWidget(
        //       text: 'antigen_test_step_one_text',
        //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //     ),
        //     SizedBox(
        //       width: size.width * 0.01,
        //     ),
        //     const TextWidget(
        //       //TODO GET THE USER FROM THE BACKEND
        //       text: 'Mateo Bonnet',
        //       requiresTranslate: false,
        //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        //     )
        //   ],
        // ),
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
            SizedBox(height: size.height * 0.035),
            const TextWidget(
              text: 'pcr_test_text_two',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: size.height * 0.035),
            ButtonWidget(
                icon: Icons.qr_code_scanner,
                iconColor: Colors.black,
                buttonColor: Colors.white,
                borderColor: Colors.black,
                textColor: Colors.black,
                buttonString: 'test_part_one_text',
                onPressed: () async {
                  _readQr();
                  //TODO OPEN QR SCAN and paste it into the identifier
                  /*
 bool validAntigen = await AntigenDataSource()
              .validateAntigen(userState.userId, testIdController.text);
          if (validAntigen == true) {
            Navigator.pushNamed(context, "selfTestQuestions");
          } else {
            errorAlertInfoPop(
                context: context,
                mainIcon: Icon(
                  Icons.cancel,
                  color: wColor.mapColors['C01'],
                  size: 46,
                ),
                titleText: 'alert_text_error_one',
                paddingHeight: height * 0.25,
                infoText: 'alert_text_error_two',
                mainButton: 'alert_text_error_three',
                mainButtonFunction: () {
                  Navigator.pop(context);
                });
          }
        }
                  */
                }),
            SizedBox(height: size.height * 0.15),
            MainButtonWidget(
                width: width * 0.920,
                height: height * 0.053,
                borderRadiusButton: 30,
                buttonString: "self_t_button",
                textColor: wColor.mapColors["P01"],
                buttonColor: wColor.mapColors["500BASE"],
                borderColor: wColor.mapColors["500BASE"],
                onPressed: () async {
                  bool validPcr = await PcrDataSource()
                      .validatePcr(userState.userId, pcrIdController.text);

                  if (validPcr == true) {
                    doneSendInfo(
                      context: context,
                      mainIcon: Icon(
                        Icons.check,
                        size: height * 0.15,
                        color: wColor.mapColors['C00'],
                      ),
                      titleText: 'alert_text_one',
                      paddingHeight: height * 0.25,
                      infoText: 'alert_text_two',
                      mainButton: 'alert_text_three',
                      mainButtonFunction: () {
                        navigationBloc.add(PageChanged(indexNavigation: 1));
                        Navigator.pushNamed(context, 'navBar');
                      },
                    );
                  } else {
                    errorAlertInfoPop(
                        context: context,
                        mainIcon: Icon(
                          Icons.cancel,
                          color: wColor.mapColors['C01'],
                          size: 46,
                        ),
                        titleText: 'alert_text_error_one',
                        paddingHeight: height * 0.25,
                        infoText: 'alert_text_error_two',
                        mainButton: 'alert_text_error_three',
                        mainButtonFunction: () {
                          Navigator.pop(context);
                        });
                  }
                })
          ],
        )
      ],
    );
  }

  Future<void> _readQr() async {
    ServiceQRWidget.escanearQr(processQr);
  }

  processQr(String value) async {
    if (value.startsWith("R00:")) {
      value = value.substring(7);
    }

    setState(() {
      pcrIdController.text = value;
    });
  }
}
