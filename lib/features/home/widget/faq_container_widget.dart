// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:Tellme/config/theme/theme.dart';
import 'package:Tellme/features/home/widget/dynamic_container_copy_widget.dart';

import '../../../common_ui/common_widgets/text/text_widget.dart';

// ignore: must_be_immutable
class VissibleContainerWidget extends StatefulWidget {
  VissibleContainerWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.balanceVisible,
    required this.questionAnswer,
    required this.questionText,
  }) : super(key: key);

  final double height;
  final double width;
  final String questionText;
  final String questionAnswer;
  bool balanceVisible;

  @override
  State<VissibleContainerWidget> createState() =>
      _VissibleContainerWidgetState();
}

class _VissibleContainerWidgetState extends State<VissibleContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final wColor = ThemesIdx20();

    return DynamicContainerCopyWidget(
      minWidth: widget.width * 0.91,
      minHeight: widget.height * 0.06,
      maxHeight: widget.height * 0.14,
      maxWidth: widget.width * 0.91,
      border: Border.all(color: Colors.black),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Row(
            children: [
              TextWidget(
                text: widget.questionText,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: wColor.mapColors['IDBlack']),
              ),
              SizedBox(width: widget.width * 0.001),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.balanceVisible = !widget.balanceVisible;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    widget.balanceVisible
                        ? Icons.arrow_upward
                        : Icons.arrow_downward, // TODO check icons
                    color: wColor.mapColors['P00'],
                  ),
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: widget.balanceVisible,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: widget.height * 0.025),
                const Divider(
                  height: 1,
                  thickness: 2,
                  color: Colors.black,
                ),
                SizedBox(height: widget.height * 0.03),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: widget.questionAnswer,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          color: wColor.mapColors['IDBlack'],
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                SizedBox(height: widget.height * 0.05),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
