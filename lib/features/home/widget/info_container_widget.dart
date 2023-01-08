import 'package:flutter/material.dart';

import '../../../config/theme/theme.dart';

class InfoContainerWidget extends StatelessWidget {
  const InfoContainerWidget({
    Key? key,
    required this.hintText,
    required this.text,
    this.icon,
  }) : super(key: key);
  final String hintText;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final idxColor = ThemesIdx20();
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hintText, style: const TextStyle(fontSize: 16)),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: size.height * 0.055,
            width: size.width,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black),
                color: idxColor.mapColors['T300']),
            child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(text),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(
                        icon,
                        color: Colors.black,
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
