import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/drawer_widget.dart';

class MyAppScaffold extends StatelessWidget {
  const MyAppScaffold({
    required this.children,
    this.withMargin = true,
    this.color,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.preferredSizeWidget,
    this.appBar,
    this.drawer,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;
  final bool withMargin;
  final Color? color;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final PreferredSizeWidget? preferredSizeWidget;
  final AppBar? appBar;
  final Drawer? drawer;

  @override
  Widget build(BuildContext context) {
    // Drawer? drawer = _buildDrawer();
    return Scaffold(
      backgroundColor: color ?? Colors.white,
      appBar: appBar,
      drawer: drawer,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
