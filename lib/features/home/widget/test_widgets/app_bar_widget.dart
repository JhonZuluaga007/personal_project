import 'package:flutter/material.dart';

import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../config/theme/theme.dart';

final wColor = ThemesIdx20();

AppBar registerAppBarWidget(void Function()? onTap, String text) => AppBar(
      leading: GestureDetector(
        onTap: onTap,
        // navigationBloc.add(PageChanged(indexNavigation: 0));
        // Navigator.pushNamed(context, 'navBar');
        // Navigator.pop(context);

        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      title: TextWidget(
        text: text,
        style: TextStyle(
            fontSize: 20,
            color: wColor.mapColors["S800"],
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2),
      ),
      centerTitle: true,
    );
