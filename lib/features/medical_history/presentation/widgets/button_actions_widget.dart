import 'package:flutter/material.dart';

import '../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../config/theme/theme.dart';
import '../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import 'confirm_alert_widget.dart';
import 'done_alert_widget.dart';

class ButtonActionsWidgets extends StatelessWidget {
  const ButtonActionsWidgets({
    Key? key,
    required this.size,
    required this.wColor,
    required this.navigationBloc,
  }) : super(key: key);

  final Size size;
  final ThemesIdx20 wColor;
  final NavigationBarBloc navigationBloc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainButtonWidget(
          width: size.width,
          textColor: wColor.mapColors['P01'],
          buttonString: 'medical_history_text_button',
          onPressed: () {
            //TODO SAVE CHANGES TO THE BACKEND
            confirmSendInfo(
              context: context,
              mainIcon: Icon(
                Icons.warning_amber,
                size: size.height * 0.12,
                color: wColor.mapColors['Warning'],
              ),
              titleText: "alert_confirm_text_one",
              paddingHeight: size.height * 0.25,
              infoText: 'alert_confirm_text_two',
              mainButton: 'alert_confirm_text_three',
              mainButtonFunction: () {
                doneSendInfo(
                  context: context,
                  mainIcon: Icon(
                    Icons.check,
                    size: size.height * 0.15,
                    color: wColor.mapColors['C00'],
                  ),
                  titleText: 'alert_text_one',
                  paddingHeight: size.height * 0.25,
                  infoText: 'alert_text_two',
                  mainButton: 'alert_text_three',
                  mainButtonFunction: () {
                    //todo check if success before
                    navigationBloc.add(PageChanged(indexNavigation: 0));
                    Navigator.pushNamed(context, 'navBar');
                  },
                ); //todo open new alert
              },
              secondButton: 'alert_confirm_text_four',
              secondButtonFunction: () {
                Navigator.pop(context);
              },
            );
          }),
    );
  }
}
