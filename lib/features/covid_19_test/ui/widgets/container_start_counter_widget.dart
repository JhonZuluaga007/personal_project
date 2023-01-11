// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../config/theme/theme.dart';

// ignore: must_be_immutable
class ContainerStartCounterWidget extends StatelessWidget {
  
  double width;
  double height;
  final List<Widget> children;

  ContainerStartCounterWidget({
    Key? key,
    required this.width,
    required this.height, 
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wColor = ThemesIdx20();
    
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: wColor.mapColors["P01"],
      ),
      child: Column(
        children: children
      ),
    );
  }
}
