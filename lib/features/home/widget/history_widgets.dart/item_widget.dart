import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/theme.dart';
import '../../../test_history/bloc/test_history_bloc.dart';
import '../../../../common_ui/common_widgets/buttons/button_widget.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget(
      {Key? key,
      required this.size,
      required this.wColor,
      required this.onPressed, 
      required this.textTestKit, 
      this.styleText
    })
      : super(key: key);

  final Size size;
  final ThemesIdx20 wColor;
  final dynamic Function() onPressed;
  final String textTestKit;
  final TextStyle? styleText;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.075,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 4, color: wColor.mapColors["T100"]!))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textTestKit,
                  style: styleText ?? const TextStyle(fontSize: 14),
                ), // TODO GET THE TEST FROM THE BACKEND
                ButtonWidget(
                    buttonColor: wColor.mapColors['S800'],
                    borderColor: wColor.mapColors['S800'],
                    textColor: wColor.mapColors['IDWhite'],
                    textStyle: const TextStyle(fontSize: 12),
                    iconSize: 14,
                    width: size.width * 0.3,
                    icon: Icons.remove_red_eye,
                    buttonString: 'history_button_icon',
                    onPressed: onPressed)
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            )
          ],
        ));
  }
}
