import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/antigen_test_bloc.dart';
import '../../../../../config/theme/theme.dart';
import '../../../../auth/presentation/bloc/helper_tools_bloc.dart';
import '../../../../auth/domain/entities/options_tools_entity.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_widgets/form_field_dropdown_widget.dart';
import '../../../../../common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import '../../../../medical_history/presentation/widgets/multi_selected_opdropdown_widget.dart';

class FirstVissibleQuestionWidget extends StatefulWidget {
  const FirstVissibleQuestionWidget({Key? key}) : super(key: key);

  @override
  State<FirstVissibleQuestionWidget> createState() =>
      _FirstVissibleQuestionWidgetState();
}

class _FirstVissibleQuestionWidgetState
    extends State<FirstVissibleQuestionWidget> {
  final List<String> firstQuestionChipLIst = [];
  final TextEditingController dateController = TextEditingController();

  late DateTime date = DateTime.now();
  String _covidQuestionValue = "Select option";
  List<OpSymptomEntity> symptomChipList = [];

  @override
  void initState() {
    final state = BlocProvider.of<AntigenTestBloc>(context).state;
    _covidQuestionValue = state.question1!.value.isNotEmpty
        ? state.question1!.value
        : 'Select option';
    symptomChipList.addAll(state.symptoms!);
    super.initState();
  }

  final todayDate = DateTime.now().toLocal();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
    final antigenState = antigenBloc.state;
    final stateHelperTools = BlocProvider.of<HelperToolsBloc>(context).state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldDropdownWidget(
          question: antigenState.question1!.name,
          generalColor: wColor.mapColors["S700"]!,
          height: height * 0.1,
          listItems: const [
            "Select option",
            "Yes",
            "No",
          ],
          selectedValue: _covidQuestionValue,
          width: width,
          onChanged: (cryptoMonthlyAmount) {
            antigenBloc.add(AntigenQuestion1Event(cryptoMonthlyAmount!));
            setState(() {
              _covidQuestionValue = cryptoMonthlyAmount;
              if (_covidQuestionValue == 'No') {
                symptomChipList = [];
              }
            });
          },
        ),
        SizedBox(height: height * 0.011),
        Visibility(
          visible: antigenState.question1!.value == "Yes" ||
              _covidQuestionValue == "Yes",
          child: Column(
            children: [
              TextWidget(
                text: antigenState.question2!.name,
                requiresTranslate: false,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.2,
                    color: wColor.mapColors["S700"]!),
              ),
              SizedBox(height: height * 0.011),
              MultiSelectedOpDropDownWidget(
                onChanged: (value) {
                  setState(() {
                    if (symptomChipList
                        .where((symptom) => symptom.id == value!.id)
                        .isEmpty) {
                      symptomChipList.add(value as OpSymptomEntity);
                    }
                    antigenBloc
                        .add(AntigenQuestion2Event(symptoms: symptomChipList));
                  });
                },
                listItem: stateHelperTools.symptoms,
                valueDefaultList: "drop_down_select_option",
                listChip: symptomChipList,
                requiredTranslate: false,
              ),
              SizedBox(height: height * 0.028),
              TextWidget(
                text: 'When did you start experiencing these symptoms?',
                style: TextStyle(
                    fontSize: 16,
                    color: wColor.mapColors['S700'],
                    fontWeight: FontWeight.w500),
                requiresTranslate: false,
              ),
              SizedBox(height: height * 0.018),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: wColor.mapColors['IDGrey']!)),
                child: GestureDetector(
                    onTap: () async {
                      final newDatePicker = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2020),
                        firstDate: DateTime(2019),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                              data: Theme.of(context).copyWith(
                                dialogBackgroundColor: wColor.mapColors['P01']!,
                                colorScheme: ColorScheme.light(
                                  primary: wColor.mapColors[
                                      'IDPink']!, // header background color
                                  onPrimary: wColor
                                      .mapColors['P01']!, // header text color
                                  onSurface: wColor
                                      .mapColors['P00']!, // body text color
                                ),
                              ),
                              child: child!);
                        },
                      );
                      if (newDatePicker != null) {
                        antigenBloc.add(AntigenQuestion3Event(
                            question3: newDatePicker.toString()));
                        dateController.text =
                            '${newDatePicker.month}/${newDatePicker.day}/${newDatePicker.year}';
                      }
                    },
                    child: TextFieldWithBorderWidget(
                      requiresTranslate: false,
                      enabled: false,
                      width: width * 0.9,
                      height: height * 0.09,
                      labelText: '12_validate_identity_label_text_eleven',
                      hintText: 'MM/DD/YYYY',
                      suffixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            Icons.calendar_today,
                            color: wColor.mapColors['IDPink'],
                          )),
                      textEditingController: dateController,
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
