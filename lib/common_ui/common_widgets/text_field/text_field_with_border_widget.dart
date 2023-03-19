import 'package:flutter/material.dart';
import 'package:Tellme/config/theme/theme.dart';
import 'package:Tellme/features/home/widget/test_widgets/app_bar_widget.dart';

import '../../../app_localizations.dart';

class TextFieldWithBorderWidget extends StatelessWidget {
  const TextFieldWithBorderWidget({
    Key? key,
    this.width,
    this.height,
    this.labelText,
    this.textInputType,
    this.textEditingController,
    this.textStyle,
    this.hintStyle,
    this.fillColor,
    required this.hintText,
    this.filled,
    this.textColor,
    this.borderColor,
    this.enabledBorder,
    this.hintTextDirection,
    this.suffixIcon,
    this.focusedBorder,
    this.isPassword,
    this.widthBorder,
    required this.requiresTranslate,
    this.validator,
    this.onChanged,
    this.textErrorValidate,
    this.textError,
    this.initialValue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final String? labelText;
  final String hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final bool? filled;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? textColor;
  final Color? borderColor;
  final TextDirection? hintTextDirection;
  final Widget? suffixIcon;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final double? widthBorder;
  final bool requiresTranslate;
  final bool? textErrorValidate;
  final String? textError;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final color = ThemesIdx20();
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width ?? size.width * 0.9,
          height: height ?? size.height * 0.06,
          child: TextFormField(
            initialValue: initialValue,
            controller: textEditingController,
            keyboardType: textInputType ?? TextInputType.emailAddress,
            autofocus: false,
            obscureText: isPassword ?? false,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: labelText != null
                  ? AppLocalizations.of(context)!.translate(labelText!)
                  : null,
              hintText: requiresTranslate
                  ? AppLocalizations.of(context)!.translate(hintText)
                  : hintText,
              suffixIcon: suffixIcon,
              hintTextDirection: hintTextDirection ?? TextDirection.ltr,
              labelStyle: textStyle ??
                  TextStyle(
                    fontFamily: 'Poppins',
                    color: textColor ?? color.mapColors['IDGrey'],
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
              hintStyle: hintStyle ??
                  TextStyle(
                    fontFamily: 'Poppins',
                    color: textColor ?? color.mapColors['IDGrey'],
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                        color: borderColor ?? color.mapColors['IDGrey']!,
                        width: widthBorder ?? 1,
                        style: BorderStyle.solid),
                  ),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? color.mapColors['IDGrey']!,
                      width: widthBorder ?? 1,
                    ),
                  ),
              filled: false,
              fillColor: fillColor ?? color.mapColors['P00'],
            ),
          ),
        ),
        Visibility(
            visible: textErrorValidate ?? false,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.0045),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.023),
                  child: Text(
                    textError ?? "Hola",
                    style:
                        TextStyle(color: wColor.mapColors["C01"], fontSize: 13),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
