import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/line_row_widget.dart';
import '../widgets/login_text_widget.dart';
import '../../../../app_localizations.dart';
import '../../../../config/theme/theme.dart';
import '../../../../common_ui/utils/utils_email.dart';
import '../../../../navigationBar/navigation_bar_widget.dart';
import '../../../../config/helpers/form_submission_status.dart';
import '../../../../common_ui/utils/utils_string_password.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../common_ui/common_widgets/text_field/text_field_with_border_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordValidateError = false;
  bool emailValidateError = false;
  bool isObscure = true;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final userNameTraslate =
        AppLocalizations.of(context)!.translate("user_name_text_one");
    final passwordTraslate =
        AppLocalizations.of(context)!.translate("password_validate_text_one");

    return MyAppScaffold(
      color: Colors.white,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      children: [
        Center(child: Image.asset('assets/icons/tellMe.png')),
        SizedBox(height: height * 0.06),
        SizedBox(
          width: double.infinity,
          child: TextWidget(
            text: '01_login_title',
            style: TextStyle(
                color: wColor.mapColors['IDBlack'],
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
        Form(
          key: loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWithBorderWidget(
                validator: (valueUserName) {
                  if (UtilsEmailUser.validateUserName(valueUserName!) ||
                      emailController.text.length < 4) {
                    return userNameTraslate;
                  } else {
                    return null;
                  }
                },
                onChanged: (userName) {
                  if (UtilsEmailUser.validateUserName(userName) ||
                      emailController.text.length < 4) {
                    setState(() {
                      emailValidateError = true;
                    });
                  } else {
                    setState(() {
                      emailValidateError = false;
                    });
                  }
                  return null;
                },
                textErrorValidate: emailValidateError,
                textError: userNameTraslate,
                key: const Key('textFieldNameLogin'),
                requiresTranslate: true,
                textColor: wColor.mapColors['P00'],
                labelText: '01_login_input_one',
                borderColor: emailValidateError
                    ? wColor.mapColors['C01']
                    : wColor.mapColors["IDGrey"],
                textEditingController: emailController,
                hintText: '01_login_input_hint_one',
                textStyle: TextStyle(
                    color: emailValidateError
                        ? wColor.mapColors['C01']
                        : wColor.mapColors["IDGrey"],
                    fontSize: 14),
                hintStyle: TextStyle(
                    color: emailValidateError
                        ? wColor.mapColors['C01']
                        : wColor.mapColors["IDGrey"],
                    fontSize: 1),
              ),
              if (emailValidateError)
                SizedBox(
                  height: height * 0.02,
                ),
              SizedBox(height: height * 0.03),
              TextFieldWithBorderWidget(
                onChanged: (password) {
                  if (UtilsStringPasword.isValidPassword(password) ||
                      password.length < 6) {
                    setState(() {
                      passwordValidateError = true;
                    });
                  } else {
                    setState(() {
                      passwordValidateError = false;
                    });
                  }
                  return null;
                },
                validator: (password) {
                  if (UtilsStringPasword.isValidPassword(password!) ||
                      password.length < 6) {
                    return passwordTraslate;
                  } else {
                    return null;
                  }
                },
                textErrorValidate: passwordValidateError,
                textError: passwordTraslate,
                key: const Key('textFieldPasswordLogin'),
                requiresTranslate: true,
                isPassword: isObscure,
                labelText: '01_login_input_two',
                borderColor: passwordValidateError
                    ? wColor.mapColors['C01']
                    : wColor.mapColors["IDGrey"],
                textColor: Colors.white,
                fillColor: wColor.mapColors['P00'],
                textEditingController: passwordController,
                hintStyle: TextStyle(
                    color: passwordValidateError
                        ? wColor.mapColors['C01']
                        : wColor.mapColors["IDGrey"],
                    fontSize: 14),
                textStyle: TextStyle(
                    color: passwordValidateError
                        ? wColor.mapColors['C01']
                        : wColor.mapColors["IDGrey"],
                    fontSize: 14),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    color: wColor.mapColors['IDGrey'],
                    onPressed: () => setState(() {
                      isObscure = !isObscure;
                    }),
                  ),
                ),
                hintText: '01_login_input_hint_two',
              ),
              if (passwordValidateError)
                SizedBox(
                  height: height * 0.02,
                ),
            ],
          ),
        ),
        SizedBox(height: height * 0.03),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (BuildContext context, state) {
            if (state.loginStatus is SubmissionSuccess) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavBarPage(
                            initialPage: 'HomePage',
                          )),
                  (route) => false);
            }
            if (state.loginStatus is SubmissionFailed) {
              final snackBar = SnackBar(
                  content: Text(state.errorMessage!),
                  action: SnackBarAction(
                    label: 'Cerrar',
                    onPressed: () {},
                  ));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state.loginStatus is FormSubmitting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: MainButtonWidget(
                  key: const Key('buttonRegisterLogin'),
                  borderColor: wColor.mapColors['IDPink'],
                  textColor: Colors.white,
                  buttonString: '01_login_button_one',
                  onPressed: () {
                    setState(() {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty &&
                          passwordController.text.length >= 6 &&
                          emailController.text.length > 4) {
                        BlocProvider.of<AuthBloc>(context).add(LoginUserE(
                            emailController.text, passwordController.text));
                      } else {}
                    });
                  },
                  buttonColor: wColor.mapColors['IDPink'],
                ),
              );
            }
          },
        ),
        SizedBox(height: height * 0.05),
        LoginTextWidget(width: width),
        SizedBox(height: height * 0.05),
        LineRowWidget(width: width, wColor: wColor),
        SizedBox(height: height * 0.05),
        //Todo activate when they validate the use of phone number
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Icon(
        //       Icons.smartphone_rounded,
        //       color: wColor.mapColors['IDBlack'],
        //     ),
        //     SizedBox(width: width * 0.01),
        //     TextWidget(
        //       text: '01_login_button_two',
        //       style: TextStyle(color: wColor.mapColors['IDGrey']),
        //     ),
        //     SizedBox(width: width * 0.01),
        //     Text(
        //       'Click here',
        //       style: TextStyle(
        //           decoration: TextDecoration.underline,
        //           color: wColor.mapColors['IDGrey']),
        //     )
        //   ],
        // )
      ],
    );
  }
}
