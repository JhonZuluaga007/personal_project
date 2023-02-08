import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/main_button_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/auth/ui/pages/login_page.dart';

import '../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../common_ui/common_widgets/responsive/dynamic_container_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../config/helpers/form_submission_status.dart';
import '../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../../../navigationBar/navigation_bar_widget.dart';
import '../../bloc/auth_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final TextEditingController oldPassword = TextEditingController();
    final TextEditingController newPassword = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);
    final userState = BlocProvider.of<AuthBloc>(context).state;
    AuthBloc userBloc = BlocProvider.of<AuthBloc>(context);

    return MyAppScaffold(
      color: Colors.white,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      children: [
        Center(child: Image.asset('assets/icons/idxLogo.png')),
        SizedBox(height: height * 0.06),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.formStatus is SubmissionSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavBarPage(
                          initialPage: 'login',
                        )),
              );
            } else if (state.formStatus is SubmissionFailed) {
              final snackBar = SnackBar(
                  content: Text(state.errorMessage),
                  action: SnackBarAction(
                    label: 'Cerrar',
                    onPressed: () {},
                  ));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: TextWidget(
                    text: '03_reset_password_title',
                    style: TextStyle(
                        color: wColor.mapColors['IDBlack'],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: height * 0.03),
                const TextWidget(
                  text: '03_reset_password_text_one',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: height * 0.05),
                DynamicContainerWidget(
                  minWidth: double.infinity,
                  maxWidth: double.infinity,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldWithBorderWidget(
                      requiresTranslate: true,
                      key: const Key('oldPassword'),
                      textColor: wColor.mapColors['P00'],
                      labelText: '03_reset_password_label_one',
                      textEditingController: oldPassword,
                      hintText: '03_reset_password_hint_one',
                      textStyle: TextStyle(
                          color: wColor.mapColors['IDGrey'], fontSize: 14),
                      hintStyle: TextStyle(
                          color: wColor.mapColors['IDGrey'], fontSize: 14),
                    ),
                    SizedBox(height: height * 0.05),
                    TextFieldWithBorderWidget(
                      requiresTranslate: true,
                      key: const Key('enterTheNewPassword'),
                      textColor: wColor.mapColors['P00'],
                      labelText: '03_reset_password_label_input_one',
                      textEditingController: newPassword,
                      hintText: '03_reset_password_hint_input_one',
                      textStyle: TextStyle(
                          color: wColor.mapColors['IDGrey'], fontSize: 14),
                      hintStyle: TextStyle(
                          color: wColor.mapColors['IDGrey'], fontSize: 14),
                    ),
                    SizedBox(height: height * 0.05),
                    TextFieldWithBorderWidget(
                      requiresTranslate: true,
                      key: const Key('confirmTheNewPassword'),
                      textColor: wColor.mapColors['P00'],
                      labelText: '03_reset_password_label_input_two',
                      textEditingController: confirmPassword,
                      hintText: '03_reset_password_hint_input_two',
                      textStyle: TextStyle(
                          color: wColor.mapColors['IDGrey'], fontSize: 14),
                      hintStyle: TextStyle(
                          color: wColor.mapColors['IDGrey'], fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.049),
                Center(
                  child: MainButtonWidget(
                    key: const Key('buttonLogin'),
                    borderColor: wColor.mapColors['IDPink'],
                    textColor: Colors.white,
                    buttonString: '03_reset_password_button',
                    //TODO validadr el ingreso hacia la aplicacion
                    onPressed: () {
                      if (oldPassword.text == newPassword.text) {
                        Navigator.pushNamed(context, 'navBar');

                        userBloc.add(ChangePassword(userState.userId,
                            oldPassword.text, newPassword.text));
                        print('ESOOOO');
                      }
                      setState(() {});

                      // navigationBloc.add(PageChanged(indexNavigation: 0));
                      // Navigator.pushNamed(context, 'navBar');
                    },

                    buttonColor: wColor.mapColors['IDPink'],
                  ),
                ),
                SizedBox(height: height * 0.03),
              ],
            );
          },
        ),
      ],
    );
  }
}
