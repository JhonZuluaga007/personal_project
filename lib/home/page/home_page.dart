import 'package:flutter/material.dart';
import 'package:personal_project/app_localizations.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/home/navigationBar/navigation_bar_widget.dart';
import 'package:personal_project/icons/icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: wColor.mapColors["IDWhite"],
        shadowColor: wColor.mapColors["IDWhite"],
        actions: [
          Image.asset("assets/icons/idx_Icon.png"),
          SizedBox(
            width: width * 0.30,
          ),
        ],
      ),
    );
  }
}
  