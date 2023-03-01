import 'package:flutter/material.dart';
import 'package:Tellme/common_ui/common_widgets/buttons/main_button_widget.dart';
import 'package:Tellme/common_ui/common_widgets/text/text_widget.dart';
import 'package:Tellme/config/theme/theme.dart';
import 'package:Tellme/features/antigen/presentation/ui/pages/antigen_register_info_page.dart';
import 'package:Tellme/features/pcr/presentation/pages/pcr_test_register_page.dart';
import 'package:Tellme/icons/icons.dart';

import '../../../../common_ui/common_widgets/drop_down_widget.dart';

class RegisterTestPage extends StatefulWidget {
  const RegisterTestPage({super.key});

  @override
  State<RegisterTestPage> createState() => _RegisterTestPageState();
}

class _RegisterTestPageState extends State<RegisterTestPage> {
  String defaultValue = 'Select option';
  bool antigen = false;
  bool pcr = false;
  final List<String> listsEnglish = [
    'Select option',
    'Antigen',
    'PCR',
  ];
  final List<String> listsSpanish = ['Select option', 'Antigen', 'PCR'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = ThemesIdx20();
    return Material(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Scrollbar(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              const TextWidget(
                text: 'test_info_screen_text_title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                height: size.height * 0.3,
                child: Image.asset(IconsFolderCovid.testPageAsset),
              ),
              SizedBox(height: size.height * 0.03),
              const TextWidget(
                  text: 'test_info_screen_text_three',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.03),
              DropDownTestWidget(
                  color: color,
                  size: size,
                  defaultValue: defaultValue,
                  antigen: antigen,
                  listEnglish: listsEnglish,
                  listSpanish: const [],
                  pcr: pcr),
            ],
          ),
        )),
      )),
    );
  }
}

class DropDownTestWidget extends StatefulWidget {
  DropDownTestWidget(
      {Key? key,
      required this.color,
      required this.size,
      required this.defaultValue,
      required this.antigen,
      required this.pcr,
      required this.listEnglish,
      required this.listSpanish})
      : super(key: key);

  final ThemesIdx20 color;
  final Size size;
  String defaultValue;
  bool antigen;
  bool pcr;
  List<String> listEnglish;
  List<String> listSpanish;

  @override
  State<DropDownTestWidget> createState() => _DropDownTestWidgetState();
}

class _DropDownTestWidgetState extends State<DropDownTestWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'test_info_screen_text_dropdown_label',
          style:
              TextStyle(fontSize: 16, color: widget.color.mapColors['IDGrey']),
        ),
        SizedBox(height: widget.size.height * 0.01),
        DropDownContainerWidget(
            listItems: widget.listEnglish,
            mainValue: widget.defaultValue,
            width: widget.size.width * 0.9,
            onChanged: (value) => {
                  setState(() {
                    widget.defaultValue = value.toString();
                    if (widget.defaultValue == 'Antigen') {
                      widget.antigen = true;
                      widget.pcr = false;
                    }
                    if (widget.defaultValue == 'PCR') {
                      widget.antigen = false;
                      widget.pcr = true;
                    }
                  })
                }),
        SizedBox(height: widget.size.height * 0.08),
        MainButtonWidget(
          width: widget.size.width * 0.9,
          textColor: Colors.white,
          buttonString: 'test_info_screen_text_button',
          onPressed: () {
            if (widget.antigen == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AntigenRegisterInfoPage(
                            isHomeNavigation: false,
                          )));
            }
            if (widget.pcr == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PcrRegisterPage(
                            isHomeNavigation: false,
                          )));
            }
          },
        ),
      ],
    );
  }
}
