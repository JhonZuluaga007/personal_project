import 'package:flutter/material.dart';

import '../../../../common_ui/common_widgets/buttons/button_widget.dart';
import '../../../../config/theme/theme.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget(
      {Key? key,
      required this.size,
      required this.wColor,
      required this.onPressed})
      : super(key: key);

  final Size size;
  final ThemesIdx20 wColor;
  final dynamic Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.075,
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 4, color: wColor.mapColors["T100"]!))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Kits #0000-0000',
                  style: TextStyle(fontSize: 14),
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
