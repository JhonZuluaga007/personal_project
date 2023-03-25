import 'package:flutter/material.dart';

import '../text/text_widget.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(
          content: TextWidget(
        text: text,
        requiresTranslate: false,
      )))
      .closed
      .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
}
