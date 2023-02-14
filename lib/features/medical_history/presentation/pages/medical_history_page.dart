import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/config/helpers/form_submission_status.dart';
import 'package:personal_project/features/auth/bloc/auth_bloc.dart';

import '../bloc/medical_history_bloc.dart';
import '../widgets/done_alert_widget.dart';
import '../../../../config/theme/theme.dart';
import '../widgets/confirm_alert_widget.dart';
import '../widgets/button_actions_widget.dart';
import '../widgets/error_alert_widget.dart';
import '../widgets/multi_selected_widget.dart';
import '../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../../antigen/data/data_source/antigen_data_source.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../common_ui/common_widgets/drop_down_widget.dart';
import '../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../widgets/text_column_widget.dart';

class MedicalHistoryPage extends StatefulWidget {
  const MedicalHistoryPage({super.key});

  @override
  State<MedicalHistoryPage> createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  String defaultValueEng = 'Select option';
  String defaultValueSp = 'Seleccionar opción';

  String defaultValueSevereEn = 'Select option';
  String defaultValueSevereSp = 'Seleccionar opción';

  final List<String> listsYesNoEnglish = ['Select option', 'Yes', 'No'];
  final List<String> listsYesNoSpanish = ['Seleccionar opción', 'Si', 'No'];

  bool yes = false;
  bool no = false;

  bool yesSevere = false;
  bool noSevere = false;

  List<String> chipListText = [];

  @override
  void initState() {
    // final stateTestMedical = BlocProvider.of<TestHistoryBloc>(context).state;
    // for (var i = 0; i < stateTestMedical.allTestHistoryList.length; i++) {
    //   AntigenDataSource()
    //     .validateAntigen('63cc20b184ce548f26c07d39', stateTestMedical.allTestHistoryList[i].code!);
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wColor = ThemesIdx20();
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);
    final stateUserId = BlocProvider.of<AuthBloc>(context).state;
    final size = MediaQuery.of(context).size;

    return BlocConsumer<MedicalHistoryBloc, MedicalHistoryState>(
      listener: (context, state) {
        if (state.status == true) {
          setState(() {
            yes = true;
            no = false;
            defaultValueEng = 'Yes';
            debugPrint(defaultValueEng);
            print(defaultValueEng);
          });
        }
        if (state.status == false) {
          setState(() {
            yes = false;
            no = true;
            debugPrint(defaultValueEng);
            print(state.question1!.value);
            defaultValueEng = 'No';
            print(defaultValueEng);
          });
        }
        if (chipListText.isEmpty && state.question2!.value.isNotEmpty) {
          chipListText = state.question2!.value;
        } else {
          state.question2!.value = chipListText;
        }
      },
      builder: (context, state) {
        return MyAppScaffold(
          crossAxisAlignment: CrossAxisAlignment.start,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            title: Image.asset("assets/icons/idx_Icon.png"),
            centerTitle: true,
          ),
          children: [
            TextColumnMedicalHistoryWidget(size: size, wColor: wColor),
            DropDownContainerWidget(
                //TODO CHECK HOW TO HANDLE MAIN VALUE
                listItems: listsYesNoEnglish,
                mainValue: defaultValueEng,
                // mainValue: state.status == false ? 'No' : 'Yes',
                width: size.width * 0.9,
                onChanged: (value) => {
                      setState(() {
                        defaultValueEng = value.toString();
                        if (defaultValueEng == 'Yes' || state.status == true) {
                          yes = true;
                          no = false;
                        }
                        if (defaultValueEng == 'No' || state.status == false) {
                          yes = false;
                          no = true;
                          chipListText.clear();
                        }
                        if (defaultValueEng == 'Select option' ||
                            state.status == false) {
                          yes = false;
                          no = true;
                        }
                      })
                    }),
            SizedBox(height: size.height * 0.02),
            Visibility(
                visible: yes,
                child: Column(
                  children: [
                    TextWidget(
                      text: "medical_history_text_four",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          color: wColor.mapColors["S800"],
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2),
                    ),
                    SizedBox(height: size.height * 0.02),
                    MultiSelectedWidget(
                      onChanged: (value) {
                        // TODO CHECK BAKEND MEDICAL HISTORY
                        setState(() {
                          if (state.question2!.value
                                  .contains(value.toString()) !=
                              true) {
                            chipListText.add(value.toString());
                            debugPrint(chipListText.toString());
                          }
                          if (state.question1!.value == 'no') {
                            chipListText.clear();
                          }
                        });
                      },
                      listItem: const [
                        "Cerebrovascular disease",
                        "Asthma",
                        "Cancer",
                        "Chronic kidney disease",
                        "Tuberculosis",
                        "Smoking (current and former)",
                        "Neurologic conditions",
                        "Hiv"
                      ],
                      valueDefaultList: "medical_history_drop_down_select",
                      listChip: chipListText,
                      requiredTranslate: false,
                    ),
                  ],
                )),
            SizedBox(height: size.height * 0.05),
            BlocConsumer<MedicalHistoryBloc, MedicalHistoryState>(
              listener: (context, state) {
                if (state.formStatus is FormSubmitting) {
                  const CircularProgressIndicator(
                    key: Key('LoaderRegisterKey'),
                  );
                }
                if (state.formStatus is SubmissionSuccess) {
                  doneSendInfo(
                    context: context,
                    mainIcon: Icon(
                      Icons.check,
                      size: size.height * 0.15,
                      color: wColor.mapColors['C00'],
                    ),
                    titleText: 'alert_text_one',
                    paddingHeight: size.height * 0.25,
                    infoText: 'alert_text_two',
                    mainButton: 'alert_text_three',
                    mainButtonFunction: () {
                      Navigator.pop(context);
                    },
                  );
                } else if (state.formStatus is SubmissionFailed) {
                  errorAlertInfoPop(
                      context: context,
                      mainIcon: Icon(
                        Icons.cancel,
                        color: wColor.mapColors['C01'],
                        size: 46,
                      ),
                      titleText: 'alert_text_error_one',
                      paddingHeight: size.height * 0.25,
                      infoText: 'alert_text_error_update',
                      mainButton: 'alert_text_error_three',
                      mainButtonFunction: () {
                        Navigator.pop(context);
                      });
                }
              },
              builder: (context, state) {
                return ButtonActionsWidgets(
                  size: size,
                  wColor: wColor,
                  navigationBloc: navigationBloc,
                  onPressed: () {
                    confirmSendInfo(
                      context: context,
                      mainIcon: Icon(
                        Icons.warning_amber,
                        size: size.height * 0.12,
                        color: wColor.mapColors['Warning'],
                      ),
                      titleText: "alert_confirm_text_one",
                      paddingHeight: size.height * 0.25,
                      infoText: 'alert_confirm_text_two',
                      mainButton: 'alert_confirm_text_three',
                      mainButtonFunction: () {
                        BlocProvider.of<MedicalHistoryBloc>(context).add(
                            EditMedicalHistoryEvent(
                                userId: stateUserId.userId,
                                responseOne: defaultValueEng,
                                responseTwo: chipListText));
                      },
                      secondButton: 'alert_confirm_text_four',
                      secondButtonFunction: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            ),
            SizedBox(height: size.height * 0.05),
          ],
        );
      },
    );
  }
}
