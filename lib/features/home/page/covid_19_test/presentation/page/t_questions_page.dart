import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/utils/const_list.dart';
import 'package:personal_project/features/auth/domain/entities/helper_tools_entity.dart';
import 'package:personal_project/features/home/page/covid_19_test/presentation/widgets/drop_down_questions_widget.dart';
import 'package:personal_project/features/home/page/covid_19_test/presentation/widgets/questions_visible_widgets.dart/second_vissible_question_widget.dart';
import 'package:personal_project/features/home/page/covid_19_test/presentation/widgets/questions_visible_widgets.dart/third_vissible_question_widget.dart';
import 'package:personal_project/features/medical_history/presentation/widgets/multi_selected_widget.dart';

import '../../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../config/theme/theme.dart';
import '../widgets/container_start_counter_widget.dart';
import '../widgets/questions_visible_widgets.dart/first_question_vissible_widget.dart';

class TQuestionsPage extends StatefulWidget {
  const TQuestionsPage({super.key});

  @override
  State<TQuestionsPage> createState() => _TQuestionsPageState();
}

class _TQuestionsPageState extends State<TQuestionsPage> {
  final double valueLinear;
  late bool firstQuestion;
  late String dropDownValue;

  _TQuestionsPageState({this.valueLinear = 0.34});

  @override
  void initState() {
    // TODO: implement initState
    firstQuestion = false;
    dropDownValue = 'No';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    final List<String> dropdownItem = [
      "self_t__drop_down_text",
      "self_t_drop_down_text_1"
    ];
    final List<String> dropdownItemVissible = [
      "self_t_drop_down_text_1",
      "self_t__drop_down_text_2",
      "self_t__drop_down_text_3"
    ];

    final List<String> covidBeforechipList = [];
    final List<String> covidBeforeAnswer = [
      "covid_before_one",
      "covid_before_two",
      "covid_before_three",
      "covid_before_four",
    ];

    final List<OpPregnantEntity> pregnantAnswerList =
        ConstLists.pregnantAnswers;

    //TODO CHECK PAGE
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: wColor.mapColors["S800"],
          ),
        ),
        centerTitle: true,
        title: TextWidget(
          text: "test_info_screen_text_one",
          style: TextStyle(
              fontSize: 20,
              color: wColor.mapColors["S800"],
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2),
        ),
        backgroundColor: wColor.mapColors["P01"],
        elevation: 4,
      ),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                FirstVissibleQuestionWidget(),
                SizedBox(
                  height: height * 0.015,
                ),
                SecondVissibleQuestionWidget(
                    dropdownItem: dropdownItem),
                SizedBox(
                  height: height * 0.015,
                ),
                //TODO Revisar el nuevo ajutes le dropDown
                /*DropDownQuestionsWidget(
                    dropDownItem: dropdownItem,
                    textQuestion: "self_t_question_test_drop_down_04",
                    width: width,
                    dropDownValue: 'Select option'),*/
                SizedBox(
                  height: height * 0.015,
                ),
                ThirdVissibleQuestionWidget(
                    dropdownItem: dropdownItemVissible),
                SizedBox(
                  height: height * 0.015,
                ),
                MultiSelectedWidget(
                  listItem: covidBeforeAnswer,
                  onChanged: (value) {
                    setState(() {
                      if (covidBeforechipList.contains(value) != true) {
                        covidBeforechipList.add(value.toString());
                      }
                    });
                  },
                  requiredTranslate: true,
                  listChip: covidBeforechipList,
                  valueDefaultList: "drop_down_select_option",
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                DropDownQuestionsWidget(
                    dropDownItem: pregnantAnswerList,
                    textQuestion: "pregnant_question",
                    width: width,
                    dropDownValue: 'Select option'),
                SizedBox(
                  height: height * 0.015,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ContainerStartCounterWidget(
          numberPageText: "2",
          valueLinear: valueLinear,
          widgetButton: buttonContinue(context),
          textContainer: "self_t_linear_text"),
    );
  }

  Widget buttonContinue(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return MainButtonWidget(
        width: width * 0.920,
        height: height * 0.053,
        borderRadiusButton: 30,
        buttonString: "self_t_button",
        textColor: wColor.mapColors["P01"],
        buttonColor: wColor.mapColors["500BASE"],
        borderColor: wColor.mapColors["500BASE"],
        onPressed: () {
          // BlocProvider.of<AntigenTestBloc>(context).add(AntigenUpdateEvent(
          //   code: state.code!,
          //   created: state.created!.date,
          //   ip: state.ip!,
          //   question1Value: dropDownValue,
          // question10Value: state.question10Value!.value!,
          // question11Value: question11Value,
          // question12Value: question12Value,
          // question13Value: question13Value,
          // question14Value: question14Value,
          //   question2Value: firstQuestionChipList,
          // question3Value: question3Value,
          // question4Value: question4Value,
          // question5Value: question5Value,
          // question6Value: question6Value,
          // question7Value: question7Value,
          // question8Value: question8Value,
          // question9Value: question9Value,
          // updated: updated
          // ));
          //Navigator.pushNamed(context, "instructionPage");
        });
  }
}
