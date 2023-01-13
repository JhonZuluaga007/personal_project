import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/main_button_widget.dart';

import '../../../../common_ui/common_widgets/drop_down_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../config/theme/theme.dart';

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

  final List<String> severeFactorsEnglish = [
    'Age 65 >= years',
    'Asthma',
    'Select option',
    'Cancer',
    'HIV',
  ];

  bool yes = false;
  bool no = false;

  bool yesSevere = false;
  bool noSevere = false;

  @override
  Widget build(BuildContext context) {
    final wColor = ThemesIdx20();
    final size = MediaQuery.of(context).size;
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
            mainValue: defaultValueEng,
            width: size.width * 0.9,
            onChanged: (value) => {
                  setState(() {
                    defaultValueEng = value.toString();
                    if (defaultValueEng == 'Yes') {
                      yes = true;
                      no = false;
                    }
                    if (defaultValueEng == 'No') {
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
                DropDownContainerWidget(
                    //TODO CHECK ENGLISH OR SPANISH
                    listItems: severeFactorsEnglish,
                    mainValue: defaultValueSevereEn,
                    width: size.width * 0.9,
                    onChanged: (value) => {
                          setState(() {
                            defaultValueSevereEn = value.toString();

                            //todo multi chip selector
                          })
                        }),
              ],
            )),
        SizedBox(height: size.height * 0.05),
        Center(
          child: MainButtonWidget(
              width: size.width,
              textColor: wColor.mapColors['P01'],
              buttonString: 'medical_history_text_button',
              onPressed: () {
                //TODO SAVE CHANGES TO THE BACKEND
              }),
        )
      ],
    );
  }
}
