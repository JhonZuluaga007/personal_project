import 'package:Tellme/features/auth/presentation/bloc/helper_tools_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/helpers/form_submission_status.dart';
import '../../../auth/domain/entities/options_tools_entity.dart';
import '../bloc/medical_history_bloc.dart';
import '../../../../config/theme/theme.dart';
import '../widgets/confirm_alert_widget.dart';
import '../widgets/button_actions_widget.dart';
import '../widgets/done_alert_widget.dart';
import '../widgets/error_alert_widget.dart';
import '../widgets/multi_selected_widget.dart';
import '../../../../navigationBar/bloc/navigation_bar_bloc.dart';
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
  bool visibilityYes = false;
  bool yesSevere = false;
  bool noSevere = false;
  List<OpDropdown> chipListText = [];
  List<String> chipListId = [];

  @override
  Widget build(BuildContext context) {
    final wColor = ThemesIdx20();
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);
    // final stateUserId = BlocProvider.of<AuthBloc>(context).state;
    final stateTools = BlocProvider.of<HelperToolsBloc>(context).state;
    final size = MediaQuery.of(context).size;
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
        const TextColumnMedicalHistoryWidget(),
        BlocConsumer<MedicalHistoryBloc, MedicalHistoryState>(
          listener: (context, state) {
            if (state.formStatus is SubmissionSuccess) {
              if (state.question1! == true) {
                setState(() {
                  visibilityYes = true;
                  chipListText = state.question2!;
                  defaultValueEng = 'Yes';
                });
              } else {
                setState(() {
                  visibilityYes = false;
                  chipListText = state.question2!;
                  defaultValueEng = 'No';
                });
              }
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
                  infoText: 'alert_text_error_update_one',
                  mainButton: 'alert_text_error_three',
                  mainButtonFunction: () {
                    Navigator.pop(context);
                  });
            }

            if (state.infoUploaded is FormSubmitting) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.infoUploaded is SubmissionSuccess) {
              doneSendInfo(
                requiresTranslateText: true,
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
                  navigationBloc.add(PageChanged(indexNavigation: 0));
                  Navigator.pushNamed(context, 'navBar');
                },
              );
            } else if (state.infoUploaded is SubmissionFailed) {
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
            if (state.formStatus is FormSubmitting) {
              return Column(
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  const Center(
                    child: CircularProgressIndicator(
                      key: Key('LoaderKey'),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                ],
              );
            }
            return Column(
              children: [
                DropDownContainerWidget(
                    listItems: listsYesNoEnglish,
                    mainValue: defaultValueEng,
                    width: size.width * 0.9,
                    onChanged: (value) => {
                          setState(() {
                            defaultValueEng = value.toString();
                            if (state.question1 == true) {
                              visibilityYes = true;
                            } else {
                              visibilityYes = false;
                            }
                          })
                        }),
                SizedBox(height: size.height * 0.02),
                Visibility(
                    visible: visibilityYes,
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
                            setState(() {
                              if (state.question2!.contains(value) != true) {
                                chipListText.add(value!);
                                state.question2 = chipListText;
                                debugPrint(chipListText.toString());
                              }
                            });
                          },
                          listItem: stateTools.riskFactors,
                          valueDefaultList: "medical_history_drop_down_select",
                          listChip: chipListText,
                          requiredTranslate: false,
                        ),
                      ],
                    )),
                SizedBox(height: size.height * 0.05),
                ButtonActionsWidgets(
                    size: size,
                    wColor: wColor,
                    navigationBloc: navigationBloc,
                    onPressed: () {
                      for (var i = 0; i < chipListText.length; i++) {
                        chipListId = [state.question2![i].id];
                        i++;
                      }
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
                          secondButton: 'alert_confirm_text_four',
                          secondButtonFunction: () {},
                          mainButtonFunction: () {
                            BlocProvider.of<MedicalHistoryBloc>(context)
                                .add(EditMedicalHistoryEvent(
                              responseOne: state.question1!,
                              responseTwo: chipListId,
                            ));
                          });
                    }),
              ],
            );
          },
        ),
      ],
    );
  }
}
