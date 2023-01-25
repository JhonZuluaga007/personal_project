import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/main_button_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/auth/ui/pages/login_page.dart';
import 'package:personal_project/features/auth/ui/pages/reset_password_page.dart';

import '../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../common_ui/common_widgets/responsive/dynamic_container_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';

class ResetPasswordPageInfo extends StatelessWidget {
  const ResetPasswordPageInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    final TextEditingController nameController = TextEditingController();

    return MyAppScaffold(
      color: Colors.white,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      children: [
        Center(child: Image.asset('assets/icons/idxLogo.png')),
        SizedBox(height: height * 0.06),
        SizedBox(
          width: double.infinity,
          child: TextWidget(
            text: '02_forgotten_password_title',
            style: TextStyle(
                color: wColor.mapColors['IDBlack'],
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: height * 0.03),
        const TextWidget(
          text: '02_forgotten_password_text_one',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: height * 0.05),
        DynamicContainerWidget(
          minWidth: double.infinity,
          maxWidth: double.infinity,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWithBorderWidget(
              key: const Key('textFieldNameLogin'),
              requiresTranslate: true,
              textColor: wColor.mapColors['P00'],
              labelText: '02_forgotten_password_label_input',
              textEditingController: nameController,
              hintText: '02_forgotten_password_hint_input',
              textStyle:
                  TextStyle(color: wColor.mapColors['IDGrey'], fontSize: 14),
              hintStyle:
                  TextStyle(color: wColor.mapColors['IDGrey'], fontSize: 1),
            ),
            SizedBox(height: height * 0.03),
          ],
        ),
        SizedBox(height: height * 0.049),
        Center(
          child: MainButtonWidget(
            key: const Key('buttonLogin'),
            borderColor: wColor.mapColors['IDPink'],
            textColor: Colors.white,
            buttonString: '02_forgotten_password_button',
            //TODO validadr el ingreso hacia la aplicacion
            onPressed: () {
              //TODO send email
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetPasswordPage()));
            },

            buttonColor: wColor.mapColors['IDPink'],
          ),
        ),
        SizedBox(height: height * 0.05),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: const Center(
            child: TextWidget(
              text: '02_forgotten_password_text_two',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: height * 0.03),
        const Center(
          child: TextWidget(text: '02_forgotten_password_text_three'),
        )
      ],
    );
  }
}
