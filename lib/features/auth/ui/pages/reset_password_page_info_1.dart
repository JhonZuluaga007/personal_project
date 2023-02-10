import 'package:flutter/material.dart';

import '../../../../app_localizations.dart';
import '../../../../common_ui/utils/utils_email.dart';
import '../../../../config/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/auth/bloc/auth_bloc.dart';
import '../../../../features/auth/ui/pages/login_page.dart';
import '../../../../config/helpers/form_submission_status.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:personal_project/navigationBar/navigation_bar_widget.dart';
import '../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../common_ui/common_widgets/responsive/dynamic_container_widget.dart';
import '../../../../common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import '../../../medical_history/presentation/widgets/done_alert_widget.dart';
import '../../../medical_history/presentation/widgets/error_alert_widget.dart';

class ResetPasswordPageInfo extends StatefulWidget {
  const ResetPasswordPageInfo({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPageInfo> createState() => _ResetPasswordPageInfoState();
}

class _ResetPasswordPageInfoState extends State<ResetPasswordPageInfo> {
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  bool emailValidateError = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final emailTraslate = AppLocalizations.of(context)!
                    .translate("email_text_invalid");

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
        Form(
          key: resetPasswordFormKey,
          child: DynamicContainerWidget(
            minWidth: double.infinity,
            maxWidth: double.infinity,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO VALIDATE A EMAIL
              TextFieldWithBorderWidget(
                textErrorValidate: emailValidateError,
                textError: emailTraslate,
                textInputType: TextInputType.emailAddress,
                key: const Key('textFieldNameLogin'),
                requiresTranslate: true,
                textColor: wColor.mapColors['P00'],
                labelText: '02_forgotten_password_label_input',
                textEditingController: emailController,
                hintText: '02_forgotten_password_hint_input',
                borderColor: emailValidateError 
                      ? wColor.mapColors['C01']
                      : wColor.mapColors["IDGrey"],
                textStyle: TextStyle(
                  color: emailValidateError 
                      ? wColor.mapColors['C01']
                      : wColor.mapColors["IDGrey"], 
                  fontSize: 14
                ),
                hintStyle: TextStyle(
                  color: emailValidateError 
                      ? wColor.mapColors['C01']
                      : wColor.mapColors["IDGrey"], 
                  fontSize: 1
                ),
                validator: (emailValidate){
                 if (UtilsEmailUser.validateEmail(emailValidate!)) {
                    return null;
                  }
                  else{
                    return emailTraslate;
                  }
                },
                onChanged: (emailValue) {
                  if (UtilsEmailUser.validateEmail(emailValue!)) {
                    setState(() {
                      emailValidateError = false;
                    });
                  } 
                  else {
                    setState(() {
                      emailValidateError = true;
                    });
                  }
                },
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
        SizedBox(height: height * 0.049),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (BuildContext context, state) {
            if (state.formResetPassword is SubmissionSuccess) {
              Navigator.pushNamed(context, 'login');
              doneSendInfo(
                  context: context,
                  mainIcon: Icon(
                    Icons.check,
                    size: height * 0.15,
                    color: wColor.mapColors['C00'],
                  ),
                  titleText: 'alert_text_one',
                  paddingHeight: height * 0.25,
                  infoText: 'alert_text_password_updated',
                  mainButton: 'alert_text_three',
                  mainButtonFunction: () {
                    authBloc.add(LogOut());

                    Navigator.pop(context);
                  });
            } else if (state.formResetPassword is SubmissionFailed) {
              errorAlertInfoPop(
                  context: context,
                  mainIcon: Icon(
                    Icons.cancel,
                    color: wColor.mapColors['C01'],
                    size: 46,
                  ),
                  titleText: 'alert_text_error_one',
                  paddingHeight: height * 0.25,
                  infoText: 'alert_text_error',
                  mainButton: 'alert_text_error_three',
                  mainButtonFunction: () {
                    Navigator.pop(context);
                  });
            }
          },
          builder: (context, state) {
            if (state.formStatus is FormSubmitting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: MainButtonWidget(
                  key: const Key('buttonForgottenPassword'),
                  borderColor: wColor.mapColors['IDPink'],
                  textColor: Colors.white,
                  buttonString: '02_forgotten_password_button',
                  onPressed: () {
                    if(emailController.text.isNotEmpty){
                      BlocProvider.of<AuthBloc>(context)
                        .add(ResetPassword(emailController.text));
                    }
                  },
                  buttonColor: wColor.mapColors['IDPink'],
                ),
              );
            }
          },
        ),
        /*Center(
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
        ),*/
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
