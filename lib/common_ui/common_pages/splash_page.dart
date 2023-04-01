import 'dart:async';
import 'package:flutter/material.dart';

import 'my_app_scaffold_page.dart';
import '../common_widgets/loader_indicator_widget.dart';
import '../../features/auth/presentation/pages/login_page.dart';

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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
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
