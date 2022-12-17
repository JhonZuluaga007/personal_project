import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/responsive/dynamic_container_widget.dart';

class MainBannerDescriptionOnboarding extends StatelessWidget {

  final String imageMainBanner;

  const MainBannerDescriptionOnboarding({
    super.key, 
    required this.imageMainBanner
  });

  @override
  Widget build(BuildContext context) {
    
    return DynamicContainerWidget(
      children: [
        Image.asset(imageMainBanner, fit: BoxFit.fitWidth,),
      ]
    );
  }
}