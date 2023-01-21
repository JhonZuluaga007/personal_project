import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/main_button_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/config/helpers/form_submission_status.dart';
import 'package:personal_project/config/theme/theme.dart';
import '../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../common_ui/common_widgets/responsive/dynamic_container_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../navigationBar/navigation_bar_widget.dart';
import '../../bloc/auth_bloc.dart';
import '../widgets/line_row_widget.dart';
import '../widgets/login_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

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
        DynamicContainerWidget(
          minWidth: double.infinity,
          maxWidth: double.infinity,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWithBorderWidget(
              key: const Key('textFieldNameLogin'),
              textColor: wColor.mapColors['P00'],
              labelText: '01_login_input_one',
              textEditingController: emailController,
              hintText: '01_login_input_hint_one',
              textStyle:
                  TextStyle(color: wColor.mapColors['IDGrey'], fontSize: 14),
              hintStyle:
                  TextStyle(color: wColor.mapColors['IDGrey'], fontSize: 1),
            ),
            SizedBox(height: height * 0.03),
            TextFieldWithBorderWidget(
              key: const Key('textFieldPasswordLogin'),
              isPassword: isObscure, // TODO CHECK
              labelText: '01_login_input_two',
              borderColor: wColor.mapColors['IDGrey'],
              textColor: Colors.white,
              fillColor: wColor.mapColors['P00'],

              textEditingController: passwordController,
              hintStyle:
                  TextStyle(color: wColor.mapColors['IDGrey'], fontSize: 14),
              textStyle:
                  TextStyle(color: wColor.mapColors['IDGrey'], fontSize: 14),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: Icon(
                    isObscure
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  ),
                  color: wColor.mapColors['IDGrey'],
                  onPressed: () => setState(() {
                    isObscure = !isObscure;
                  }),
                ),
              ),
              hintText: '01_login_input_hint_two',
            ),
          ],
        ),
        SizedBox(height: height * 0.03),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (BuildContext context, state) {
            if(state.formStatus is SubmissionSuccess){
              Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => const NavBarPage(
                      initialPage: 'HomePage',
                    )
                  ),
                );
            }
            else if(state.formStatus is SubmissionFailed){
              final snackBar = SnackBar(
                content: Text(state.errorMessage),
                action: SnackBarAction(
                  label: 'Cerrar',
                  onPressed: () {},
                )
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if(state.formStatus is FormSubmitting){
              return const Center(
                child: CircularProgressIndicator()
              );
            }
            else{
              return Center(
                child: MainButtonWidget(
                  key: const Key('buttonRegisterLogin'),
                  borderColor: wColor.mapColors['IDPink'],
                  textColor: Colors.white,
                  buttonString: '01_login_button_one',
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(LoginUserE(
                              emailController.text, passwordController.text));
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
