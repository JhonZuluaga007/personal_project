import 'package:flutter/material.dart';

import 'gradient_circular_progress_indicator_widget.dart';

class LoaderIndicatorWidget extends StatelessWidget {
  final AnimationController animationController;
  const LoaderIndicatorWidget({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
              ),
              child: Image.asset(
                'assets/icons/tellMe.png',
              ),
            ),
          ),
          SizedBox(height: size.height * 0.1),
          Center(
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
              child: const GradientCircularProgressIndicator(
                radius: 25,
                gradientColors: [
                  Colors.white,
                  Colors.blueAccent,
                ],
                strokeWidth: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
