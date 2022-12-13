import 'package:flutter/material.dart';

class DynamicContainerWidget extends StatelessWidget {
  const DynamicContainerWidget(
      {Key? key,
      this.minWidth,
      this.maxWidth,
      this.minHeight,
      this.maxHeight,
      this.topLeft,
      this.topRight,
      this.bottomLeft,
      this.bottomRight,
      this.boxShadow,
      this.mainAxisAlignment,
      this.crossAxisAlignment,
      this.borderColor,
      this.colorContainer,
      this.border,
      required this.children})
      : super(key: key);

  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;
  final Radius? topLeft;
  final Radius? topRight;
  final Radius? bottomLeft;
  final Radius? bottomRight;
  final List<BoxShadow>? boxShadow;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final Color? colorContainer;
  final List<Widget> children;
  final Color? borderColor;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: minWidth ?? 0.0,
          maxWidth: maxWidth ?? double.infinity,
          minHeight: minHeight ?? 0.0,
          maxHeight: maxHeight ?? double.infinity),
      child: Container(
        decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.only(
                topLeft: topLeft ?? Radius.zero,
                topRight: topRight ?? Radius.zero,
                bottomLeft: bottomLeft ?? Radius.zero,
                bottomRight: bottomRight ?? Radius.zero),
            boxShadow: boxShadow ?? [],
            color: colorContainer ?? Colors.transparent),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
