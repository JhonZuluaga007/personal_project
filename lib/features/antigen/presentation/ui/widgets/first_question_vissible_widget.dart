import 'package:flutter/material.dart';
import 'date_picker_container_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/antigen_test_bloc.dart';
import '../../../../../config/theme/theme.dart';
import '../../../../../common_ui/utils/const_list.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../presentation/ui/widgets/multi_selector_string_widget.dart';
import '../../../../../common_ui/common_widgets/form_field_dropdown_widget.dart';

class FirstVissibleQuestionWidget extends StatefulWidget {
  const FirstVissibleQuestionWidget({Key? key}) : super(key: key);
  @override
  State<FirstVissibleQuestionWidget> createState() =>
      _FirstVissibleQuestionWidgetState();
}

class _FirstVissibleQuestionWidgetState
    extends State<FirstVissibleQuestionWidget> {
  final List<String> firstQuestionChipLIst = [];

  late DateTime date = DateTime.now();
  String _covidQuestionValue = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final antigenBloc = BlocProvider.of<AntigenTestBloc>(context);

    return BlocBuilder<AntigenTestBloc, AntigenTestState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormFieldDropdownWidget(
              question: antigenBloc.state.question1!.name,
              generalColor: wColor.mapColors["S700"]!,
              height: height * 0.07,
              listItems: const [
                //TODO CHECK LANGUAGUE
                "",
                "Yes",
                "No",
              ],
              selectedValue: state.question1!.value != _covidQuestionValue
                  ? state.question1!.value
                  : _covidQuestionValue,
              width: width,
              onChanged: (cryptoMonthlyAmount) {
                antigenBloc.add(AntigenQuestion1Event(cryptoMonthlyAmount!));
                setState(() {
                  _covidQuestionValue = cryptoMonthlyAmount;
                });
              },
            ),
            SizedBox(height: height * 0.021),
            Visibility(
              visible: state.question1!.value == "Yes" ||
                  _covidQuestionValue == "Yes",
              child: Column(
                children: [
                  TextWidget(
                    text: antigenBloc.state.question2!.name,
                    requiresTranslate: false,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.2,
                        color: wColor.mapColors["S700"]!),
                  ),
                  SizedBox(height: height * 0.011),
                  MultiSelectedStringWidget(
                    listItem: ConstLists.symptomsAssociatedList,
                    onChanged: (value) {
                      setState(() {
                        if (firstQuestionChipLIst.contains(value) != true) {
                          firstQuestionChipLIst.add(value.toString());
                        }
                      });
                      antigenBloc.add(AntigenQuestion2Event(
                          question2: firstQuestionChipLIst));
                    },
                    valueDefaultList: "drop_down_select_option",
                    listChip: state.question2!.value != firstQuestionChipLIst
                        ? state.question2!.value
                        : firstQuestionChipLIst,
                    requiredTranslate: false,
                  ),
                  SizedBox(height: height * 0.028),
                  DatePickerContainerWidget(
                    textQuestions: antigenBloc.state.question3!.name,
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2019),
                        lastDate: DateTime.now(),
                      );

                      if (newDate == null) return;

                      setState(() {
                        date = newDate;
                      });

                      antigenBloc.add(
                          AntigenQuestion3Event(question3: newDate.toString()));
                    },
                    date: date,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
