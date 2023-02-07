import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../config/theme/theme.dart';
import '../../../../icons/icons.dart';
import '../../../test_history/bloc/test_history_bloc.dart';

Future popUpWidget(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final wColor = ThemesIdx20();

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.049, vertical: height * 0.052),
                child: BlocBuilder<TestHistoryBloc, TestHistoryState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: height * 0.50,
                      width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconsFolderCovid.popUpSkyTimer,
                              // state.testView[index].user.image,
                              height: height * 0.2,
                              fit: BoxFit.cover,
                            ), //TODO Get user image
                            SizedBox(height: height * 0.031),
                            TextWidget(
                              text: "Mateo Bonnett",
                              // text: state.testView[index].user.name,
                              textAlign: TextAlign.center,
                              requiresTranslate: false,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: wColor.mapColors["S800"],
                              ),
                            ),
                            SizedBox(height: height * 0.011),
                            Center(
                              child: Row(
                                children: [
                                  SizedBox(width: width * 0.1),
                                  TextWidget(
                                    text: "Status last test:",
                                    textAlign: TextAlign.center,
                                    requiresTranslate: false,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: wColor.mapColors["S600"],
                                    ),
                                  ),
                                  SizedBox(width: width * 0.01),
                                  const Icon(Icons.cancel),
                                  // state.testView[index].result[index].result ==
                                  //         "Negative"
                                  //     ? const Icon(Icons.cancel)
                                  //     : const Icon(Icons.check_circle),
                                  //TODO CHECK LAST TEST
                                  SizedBox(width: width * 0.01),
                                  TextWidget(
                                    text: "Negative",
                                    textAlign: TextAlign.center,
                                    requiresTranslate: false,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: wColor.mapColors["S600"],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.011),
                            TextWidget(
                              text:
                                  "Date: 03/06/2022", // TODO GET DATE FROM BACKEND
                              textAlign: TextAlign.center,
                              requiresTranslate: false,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: wColor.mapColors["S800"],
                              ),
                            ),
                            SizedBox(height: height * 0.011),
                            TextWidget(
                              text:
                                  "Hour: 00:00:00", // TODO GET THE HOUR FROM BACKEND
                              textAlign: TextAlign.center,
                              requiresTranslate: false,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: wColor.mapColors["S800"],
                              ),
                            ),
                            SizedBox(height: height * 0.044),

                            MainButtonWidget(
                                buttonString: "popUp_button_text_1",
                                textColor: wColor.mapColors["P01"],
                                buttonColor: wColor.mapColors["S800"],
                                borderColor: wColor.mapColors["S800"],
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            SizedBox(height: height * 0.012),
                          ]
                      ),
                    );
                  }
                ),
              )
            ]);
      });
}
