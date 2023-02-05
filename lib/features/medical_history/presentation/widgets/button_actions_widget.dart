import 'package:flutter/material.dart';

import '../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../config/theme/theme.dart';
import '../../../../navigationBar/bloc/navigation_bar_bloc.dart';

class ButtonActionsWidgets extends StatelessWidget {
  const ButtonActionsWidgets({
    Key? key,
    required this.size,
    required this.wColor,
    required this.navigationBloc, 
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final ThemesIdx20 wColor;
  final NavigationBarBloc navigationBloc;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainButtonWidget(
        width: size.width,
        textColor: wColor.mapColors['P01'],
        buttonString: 'medical_history_text_button',
        onPressed: onPressed
      ),
    );
  }
}
