import 'dart:async';

import 'package:flutter/material.dart';
import 'package:personal_project/features/auth/ui/pages/login_page.dart';

import '../common_widgets/loader_indicator_widget.dart';
import 'my_app_scaffold_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );

    ///TODO check shared preferences if user has not done kyc avoid the intro.
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MyAppScaffold(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.25,
        ),
        LoaderIndicatorWidget(
          animationController: _animationController,
        )
      ],
    );
  }
}
