import 'package:flutter/material.dart';
import 'package:Tellme/config/theme/theme.dart';

import '../../../app_localizations.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.buttonString,
    this.width,
    this.height,
    this.iconsButton,
    this.boxDecoration,
    this.textStyle,
    this.borderColor,
    this.textColor,
    this.buttonColor,
    required this.onPressed,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.borderRadiusButton,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String buttonString;
  final String? iconsButton;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;
  final Function() onPressed;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final IconData? icon;
  final double? iconSize;
  final double? borderRadiusButton;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    final color = ThemesIdx20();

    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(width ?? sizeWidth * 0.9, height ?? sizeHeight * 0.055),
        ),
        maximumSize: MaterialStateProperty.all(
          Size(width ?? sizeWidth * 0.9, height ?? sizeHeight * 0.055),
        ),
        backgroundColor: MaterialStateProperty.all(
          buttonColor ?? color.mapColors['P00'],
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusButton ?? 36),
            side: BorderSide(
                color: borderColor ?? color.mapColors['P00']!, width: 1),
          ),
        ),
      ),
      onPressed: onPressed,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(
              width: sizeWidth * 0.01,
            ),
            Text(
              // buttonString,
              AppLocalizations.of(context)!.translate(buttonString),
              style: textStyle ??
                  TextStyle(
                    color: textColor ?? color.mapColors['P00'],
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
