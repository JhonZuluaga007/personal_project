import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/config/theme/theme.dart';

import '../../../app_localizations.dart';

class TextFieldNoLabelWidget extends StatelessWidget {
  const TextFieldNoLabelWidget(
      {Key? key,
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
      required this.text,
      this.validator})
      : super(key: key);

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
  final double? widthBorder;
  final bool requiresTranslate;
  final String text;

  @override
  Widget build(BuildContext context) {
    final color = ThemesIdx20();
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: text,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: textColor ?? color.mapColors['IDBlack'],
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        SizedBox(
          width: width ?? size.width * 0.9,
          height: height ?? size.height * 0.06,
          child: TextFormField(
            controller: textEditingController,
            keyboardType: textInputType ?? TextInputType.emailAddress,
            autofocus: false,
            obscureText: isPassword ?? false,
            validator: validator,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    fontSize: 14,
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
      ],
    );
  }
}
