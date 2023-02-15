import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/main_button_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import 'package:personal_project/common_ui/utils/utils_string_password.dart';
import 'package:personal_project/config/theme/theme.dart';

import '../../../../app_localizations.dart';
import '../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../common_ui/common_widgets/responsive/dynamic_container_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../config/helpers/form_submission_status.dart';

import '../../../medical_history/presentation/widgets/done_alert_widget.dart';
import '../../../medical_history/presentation/widgets/error_alert_widget.dart';
import '../../bloc/auth_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  bool oldPasswordValidateError = false;
  bool newPasswordValidateError = false;
  bool confirmPasswordValidateError = false;

  final GlobalKey<FormState> resetPassForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final passwordTraslate =
        AppLocalizations.of(context)!.translate("password_validate_text_one");

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
        Column(
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
            Form(
              key: resetPassForm,
              child: DynamicContainerWidget(
                minWidth: double.infinity,
                maxWidth: double.infinity,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldWithBorderWidget(
                    textErrorValidate: oldPasswordValidateError,
                    requiresTranslate: true,
                    key: const Key('oldPassword'),
                    textError: passwordTraslate,
                    textColor: wColor.mapColors['P00'],
                    labelText: '03_reset_password_label_one',
                    textEditingController: oldPassword,
                    hintText: '03_reset_password_hint_one',
                    borderColor: oldPasswordValidateError
                        ? wColor.mapColors['C01']
                        : wColor.mapColors["IDGrey"],
                    textStyle: TextStyle(
                        color: oldPasswordValidateError
                            ? wColor.mapColors['C01']
                            : wColor.mapColors["IDGrey"],
                        fontSize: 14),
                    hintStyle: TextStyle(
                        color: oldPasswordValidateError
                            ? wColor.mapColors['C01']
                            : wColor.mapColors["IDGrey"],
                        fontSize: 14),
                    onChanged: (oldPasswordValue) {
                      if (UtilsStringPasword.isValidPassword(
                              oldPassword.text) ||
                          oldPasswordValue!.length < 6) {
                        setState(() {
                          oldPasswordValidateError = true;
                        });
                      } else {
                        setState(() {
                          oldPasswordValidateError = false;
                        });
                      }
                    },
                    validator: (oldPasswordValidate) {
                      if (UtilsStringPasword.isValidPassword(
                              oldPassword.text) ||
                          oldPasswordValidate!.length < 6) {
                        return passwordTraslate;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  TextFieldWithBorderWidget(
                    textErrorValidate: newPasswordValidateError,
                    requiresTranslate: true,
                    key: const Key('enterTheNewPassword'),
                    textColor: wColor.mapColors['P00'],
                    labelText: '03_reset_password_label_input_one',
                    textEditingController: newPassword,
                    textError: passwordTraslate,
                    hintText: '03_reset_password_hint_input_one',
                    borderColor: newPasswordValidateError
                        ? wColor.mapColors['C01']
                        : wColor.mapColors["IDGrey"],
                    textStyle: TextStyle(
                        color: newPasswordValidateError
                            ? wColor.mapColors['C01']
                            : wColor.mapColors["IDGrey"],
                        fontSize: 14),
                    hintStyle: TextStyle(
                        color: newPasswordValidateError
                            ? wColor.mapColors['C01']
                            : wColor.mapColors["IDGrey"],
                        fontSize: 14),
                    onChanged: (newPasswordValue) {
                      if (UtilsStringPasword.isValidPassword(
                              oldPassword.text) ||
                          newPasswordValue!.length < 6) {
                        setState(() {
                          newPasswordValidateError = true;
                        });
                      } else {
                        setState(() {
                          newPasswordValidateError = false;
                        });
                      }
                    },
                    validator: (newPasswordValidate) {
                      if (UtilsStringPasword.isValidPassword(
                              oldPassword.text) ||
                          newPasswordValidate!.length < 6) {
                        return passwordTraslate;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  TextFieldWithBorderWidget(
                    textErrorValidate: confirmPasswordValidateError,
                    requiresTranslate: true,
                    key: const Key('confirmTheNewPassword'),
                    textColor: wColor.mapColors['P00'],
                    labelText: '03_reset_password_label_input_two',
                    textEditingController: confirmPassword,
                    textError: passwordTraslate,
                    borderColor: confirmPasswordValidateError
                        ? wColor.mapColors['C01']
                        : wColor.mapColors["IDGrey"],
                    hintText: '03_reset_password_hint_input_two',
                    textStyle: TextStyle(
                        color: confirmPasswordValidateError
                            ? wColor.mapColors['C01']
                            : wColor.mapColors["IDGrey"],
                        fontSize: 14),
                    hintStyle: TextStyle(
                        color: confirmPasswordValidateError
                            ? wColor.mapColors['C01']
                            : wColor.mapColors["IDGrey"],
                        fontSize: 14),
                    onChanged: (confirmPasswordValue) {
                      if (UtilsStringPasword.isValidPassword(
                              confirmPasswordValue!) ||
                          confirmPasswordValue.length < 6) {
                        setState(() {
                          confirmPasswordValidateError = true;
                        });
                      } else {
                        setState(() {
                          confirmPasswordValidateError = false;
                        });
                      }
                    },
                    validator: (confirmPasswordValidate) {
                      if (UtilsStringPasword.isValidPassword(
                              confirmPasswordValidate!) ||
                          confirmPasswordValidate.length < 6) {
                        return passwordTraslate;
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.049),
            BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state.formChangePasswordStatus is SubmissionSuccess) {
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
                      // Navigator.pushReplacementNamed(context, 'login');

                      authBloc.add(LogOut());

                      Navigator.pop(context);
                    });
              } else if (state.formChangePasswordStatus is SubmissionFailed) {
                errorAlertInfoPop(
                    context: context,
                    mainIcon: Icon(
                      Icons.cancel,
                      color: wColor.mapColors['C01'],
                      size: 46,
                    ),
                    titleText: 'alert_text_error_one',
                    paddingHeight: height * 0.25,
                    infoText: 'alert_text_password_error',
                    mainButton: 'alert_text_error_three',
                    mainButtonFunction: () {
                      Navigator.pop(context);
                    });
              }
            }, builder: (context, state) {
              if (state.formChangePasswordStatus is FormSubmitting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Center(
                  child: MainButtonWidget(
                    key: const Key('buttonLogin'),
                    borderColor: wColor.mapColors['IDPink'],
                    textColor: Colors.white,
                    buttonString: '03_reset_password_button',
                    onPressed: () async {
                      setState(() {
                        if (oldPassword.text.isNotEmpty &&
                            oldPassword.text.length >= 6 &&
                            newPassword.text.isNotEmpty &&
                            newPassword.text.length >= 6 &&
                            confirmPassword.text.isNotEmpty &&
                            confirmPassword.text.length >= 6) {
                          if (confirmPassword.text == newPassword.text) {
                            BlocProvider.of<AuthBloc>(context).add(
                                ChangePassword(state.userId, oldPassword.text,
                                    newPassword.text));
                          } else {
                            if (confirmPassword.text != newPassword.text) {
                              final snackBar = SnackBar(
                                  content:
                                      const TextWidget(text: 'match_password'),
                                  action: SnackBarAction(
                                    label: 'Close', //TODO CHECK LANGUAGE
                                    onPressed: () {},
                                  ));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        }
                      });
                    },
                    buttonColor: wColor.mapColors['IDPink'],
                  ),
                );
              }
            }),
            SizedBox(height: height * 0.03),
          ],
        )
      ],
    );
  }
}
