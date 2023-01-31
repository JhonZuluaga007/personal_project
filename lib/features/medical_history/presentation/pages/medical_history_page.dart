import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/main_button_widget.dart';
import 'package:personal_project/features/medical_history/presentation/widgets/confirm_alert_widget.dart';
import 'package:personal_project/features/medical_history/presentation/widgets/done_alert_widget.dart';
import 'package:personal_project/features/medical_history/presentation/widgets/multi_selected_widget.dart';

import '../../../../common_ui/common_widgets/drop_down_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../config/theme/theme.dart';
import '../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../bloc/medical_history_bloc.dart';
import '../widgets/button_actions_widget.dart';

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

  @override
  void initState() {
    BlocProvider.of<MedicalHistoryBloc>(context)
        .add(GetMedicalHistoryEvent('63b6f8217421999ac5a4a948'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wColor = ThemesIdx20();
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);
    final size = MediaQuery.of(context).size;
    return BlocConsumer<MedicalHistoryBloc, MedicalHistoryState>(
      listener: (context, state) {
        if (state.status == true) {
          yes = true;
          no = false;
          setState(() {});
        }
        if (state.status == false) {
          yes = false;
          no = true;
          setState(() {});
        }
      },
      builder: (context, state) {
        return MyAppScaffold(
          crossAxisAlignment: CrossAxisAlignment.start,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              // navigationBloc.add(PageChanged(indexNavigation: 0));
              // Navigator.pushNamed(context, 'navBar');

              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            title: Image.asset("assets/icons/idx_Icon.png"),
            // title: TextWidget(
            //   text: "medical_history_title",
            //   style: TextStyle(
            //       fontSize: 20,
            //       color: wColor.mapColors["S800"],
            //       fontWeight: FontWeight.w600,
            //       letterSpacing: -0.2),
            // ),
            centerTitle: true,
          ),
          children: [
            SizedBox(height: size.height * 0.05),
            TextWidget(
              text: "medical_history_title",
              style: TextStyle(
                  fontSize: 20,
                  color: wColor.mapColors["S800"],
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2),
            ),
            SizedBox(height: size.height * 0.025),
            TextWidget(
              text: "medical_history_text_one",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: wColor.mapColors["S800"],
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.2),
            ),
            SizedBox(height: size.height * 0.025),
            TextWidget(
              text: "medical_history_text_two",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  color: wColor.mapColors["S800"],
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2),
            ),
            SizedBox(height: size.height * 0.02),
            TextWidget(
              text: "medical_history_text_three",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: wColor.mapColors["S800"],
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.2),
            ),
            SizedBox(height: size.height * 0.02),
            DropDownContainerWidget(
                //TODO CHECK ENGLISH OR SPANISH
                listItems: listsYesNoEnglish,
                mainValue: state.status == false ? 'No' : 'Yes',
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
                      listItem: [
                        "medical_history_drop_down_text",
                        "medical_history_drop_down_text_1",
                        "medical_history_drop_down_text_2",
                        "medical_history_drop_down_text_3"
                      ],
                      valueDefaultList: "medical_history_drop_down_select",
                    ),
                  ],
                )),
            SizedBox(height: size.height * 0.05),
            ButtonActionsWidgets(
                size: size, wColor: wColor, navigationBloc: navigationBloc),
          ],
        );
      },
    );
  }
}
