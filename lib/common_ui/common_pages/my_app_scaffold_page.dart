import 'package:flutter/material.dart';

class MyAppScaffold extends StatelessWidget {
  const MyAppScaffold({
    required this.children,
    this.withMargin = true,
    this.color,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.preferredSizeWidget,
    this.appBar,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;
  final bool withMargin;
  final Color? color;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final PreferredSizeWidget? preferredSizeWidget;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    // Drawer? drawer = _buildDrawer();
    return Scaffold(
      backgroundColor: color ?? Colors.white,
      appBar: appBar,
      body: SafeArea(
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
