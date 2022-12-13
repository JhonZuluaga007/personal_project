import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/config/theme/theme.dart';

import '../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../common_ui/common_widgets/buttons/button_widget.dart';
import '../../../../common_ui/common_widgets/responsive/dynamic_container_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  late bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: TextWidget(
                  text: '01_login_title',
                  style: TextStyle(
                      color: wColor.mapColors['P00'],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: height * 0.03),
              const TextWidget(
                text: '01_login_text_one',
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
                    textColor: wColor.mapColors['P00'],
                    labelText: '01_login_input_one',
                    textEditingController: nameController,
                    hintText: '01_login_input_hint_one',
                    hintStyle:
                        TextStyle(color: wColor.mapColors['P00'], fontSize: 16),
                  ),
                  SizedBox(height: height * 0.03),
                  TextFieldWithBorderWidget(
                    key: const Key('textFieldPasswordLogin'),
                    isPassword: _isObscure,
                    labelText: '01_login_input_two',
                    borderColor: wColor.mapColors['P00'],
                    textColor: Colors.white,
                    fillColor: wColor.mapColors['P00'],
                    hintStyle:
                        TextStyle(color: wColor.mapColors['P00'], fontSize: 16),
                    textStyle:
                        TextStyle(color: wColor.mapColors['P00'], fontSize: 12),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        icon: Icon(
                          _isObscure
                              ? Icons.remove_red_eye
                              : Icons.remove_circle,
                        ),
                        color: wColor.mapColors['P00'],
                        onPressed: () => setState(() {
                          _isObscure = !_isObscure;
                        }),
                      ),
                    ),
                    hintText: '01_login_input_hint_two',
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.049),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ButtonWidget(
            //   key: const Key('buttonRegisterLogin'),
            //   borderColor: wColor.mapColors['P00'],
            //   textColor: Colors.white,
            //   width: width * 0.43,
            //   buttonString: '01_login_button_one',
            //   onPressed: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const RegisterPages()),
            //   ),
            //   buttonColor: wColor.mapColors['P00'],
            // ),
            SizedBox(width: width * 0.04),
            // ButtonWidget(
            //     key: const Key('buttonLogin'),
            //     borderColor: wColor.mapColors['P00'],
            //     textColor: Colors.white,
            //     width: width * 0.30,
            //     buttonString: '01_login_button_two',
            //     //TODO validadr el ingreso hacia la aplicacion
            //     onPressed: () => Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => const TabsPage()),
            //         ),
            //     buttonColor: wColor.mapColors['P00']),
          ],
        ),
        SizedBox(height: height * 0.05),
        const SizedBox(
          width: double.infinity,
          child: TextWidget(
            text: '01_login_recover_password',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.underline),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
