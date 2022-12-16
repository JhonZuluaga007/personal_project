import 'package:flutter/material.dart';

class CardScanLabel extends StatelessWidget {

  final String imagesScanLabel;
  final String imageCovid_19;
  final String imageTestStatusResult;

  const CardScanLabel({
    super.key, 
    required this.imagesScanLabel, 
    required this.imageCovid_19, 
    required this.imageTestStatusResult
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Image.asset(imagesScanLabel),
        SizedBox(
          height: height * 0.021,
        ),
        Image.asset(imageCovid_19),
        SizedBox(
          height: height * 0.021,
        ),
        Image.asset(imageTestStatusResult),
      ],
    );
  }
}