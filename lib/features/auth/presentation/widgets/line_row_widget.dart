import 'package:flutter/material.dart';

import '../../../../common_ui/common_widgets/separator_widget.dart';
import '../../../../config/theme/theme.dart';

class LineRowWidget extends StatelessWidget {
  const LineRowWidget({
    Key? key,
    required this.width,
    required this.wColor,
  }) : super(key: key);

  final double width;
  final ThemesIdx20 wColor;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollControllerRow = ScrollController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        controller: scrollControllerRow,
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 5,
              width: width * 0.4,
              child: Flex(direction: Axis.vertical, children: [
                MySeparator(
                  height: 2,
                  color: wColor.mapColors['IDGrey']!,
                )
              ]),
            ),
            Text(
              'o',
              style: TextStyle(fontSize: 16, color: wColor.mapColors['IDGrey']),
            ),
            SizedBox(
              height: 5,
              width: width * 0.4,
              child: Flex(direction: Axis.vertical, children: [
                MySeparator(
                  height: 2,
                  color: wColor.mapColors['IDGrey']!,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
