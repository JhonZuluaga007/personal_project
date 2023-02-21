import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/features/auth/bloc/auth_bloc.dart';
import 'package:personal_project/features/test_history/domain/entities/test_history_entity.dart';

import '../../../../icons/icons.dart';
import '../../../../config/theme/theme.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../common_ui/common_widgets/buttons/main_button_widget.dart';

Future popUpWidget(BuildContext context, TestHistoryEntity testView) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final wColor = ThemesIdx20();

  final stateUserId = BlocProvider.of<AuthBloc>(context).state;

  final dateCreate = testView.created!.date;

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
                child: SizedBox(
                  height: height * 0.55,
                  width: width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //TODO GET ACTUAL TEST IMAGE
                        // FadeInImage(
                        //     image: NetworkImage(testView.photo!),
                        //     placeholder:
                        //         const AssetImage('assets/images/no_image.png')),
                        Image.asset(
                          IconsFolderCovid.popUpSkyTimer,
                          height: height * 0.2,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: height * 0.031),
                        TextWidget(
                          text: "${stateUserId.name} ${stateUserId.lastname}",
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
                              Visibility(
                                visible: testView.result!.isNotEmpty,
                                child: testView.result!.isNotEmpty
                                    ? SizedBox(
                                        child: testView.result!.first!.result ==
                                                "Negative"
                                            ? const Icon(Icons.cancel)
                                            : const Icon(Icons.check_circle),
                                      )
                                    : const SizedBox(),
                              ),
                              SizedBox(width: width * 0.01),
                              TextWidget(
                                text: testView.result!.isNotEmpty
                                    ? testView.result!.first!.result!
                                    : "In progress",
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
                              "${dateCreate.day} / ${dateCreate.month} / ${dateCreate.year}",
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
                          text: "${dateCreate.hour}:${dateCreate.minute}",
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
                      ]),
                ),
              )
            ]);
      });
}
