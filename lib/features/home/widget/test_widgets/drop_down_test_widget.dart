import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../common_ui/common_widgets/drop_down_widget.dart';

// ignore: must_be_immutable
class DropDownTestWidgetMyProfile extends StatefulWidget {
  DropDownTestWidgetMyProfile(
      {Key? key,
      required this.item,
      required this.width,
      required this.valueState,
      required this.fieldText})
      : super(key: key);
  final List<String> item;
  String valueState;
  final double width;
  final String fieldText;

  @override
  State<DropDownTestWidgetMyProfile> createState() =>
      _DropDownTestWidgetMyProfileState();
}

class _DropDownTestWidgetMyProfileState
    extends State<DropDownTestWidgetMyProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = ThemesIdx20();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: widget.fieldText,
          style: TextStyle(fontSize: 16, color: color.mapColors['IDGrey']),
        ),
        SizedBox(height: size.height * 0.01),
        DropDownContainerWidget(
            listItems: widget.item,
            mainValue: widget.valueState,
            width: widget.width * 0.9,
            onChanged: (value) => {
                  setState(() {
                    widget.valueState = value.toString();
                  })
                }),
      ],
    );
  }
}
