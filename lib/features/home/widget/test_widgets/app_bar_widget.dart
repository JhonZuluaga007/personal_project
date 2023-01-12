import 'package:flutter/material.dart';

import '../../../../common_ui/common_widgets/text/text_widget.dart';

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
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      centerTitle: true,
    );
