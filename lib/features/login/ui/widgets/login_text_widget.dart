import 'package:flutter/material.dart';

import '../../../../common_ui/common_widgets/text/text_widget.dart';

class LoginTextWidget extends StatelessWidget {
  const LoginTextWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget(
              text: '01_login_recover_password',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: width * 0.01),
            GestureDetector(
              onTap: () {
                //TODO open reset password
              },
              child: const TextWidget(
                text: 'Click here',
                requiresTranslate: false,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
