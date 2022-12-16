import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/responsive/dynamic_container_widget.dart';
import 'package:personal_project/config/theme/theme.dart';

class MainBannerDescriptionOnboarding extends StatelessWidget {

  final String imageMainBanner;

  const MainBannerDescriptionOnboarding({
    super.key, 
    required this.imageMainBanner
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    
    return DynamicContainerWidget(
      children: [
        Image.asset(imageMainBanner, fit: BoxFit.fitWidth,),
      ]
    );
  }
}