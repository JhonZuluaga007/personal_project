import 'package:flutter/material.dart';

import '../../../app_localizations.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.requiresTranslate = true,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool requiresTranslate;

  @override
  Widget build(BuildContext context) {
    return Text(
      // text,
      requiresTranslate ? AppLocalizations.of(context)!.translate(text) : text,
      textAlign: textAlign,
      style: style,
    );
  }
}
