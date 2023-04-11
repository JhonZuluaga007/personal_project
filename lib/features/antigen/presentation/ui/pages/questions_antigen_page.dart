import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/antigen_test_bloc.dart';
import '../widgets/four_question_widget.dart';
import '../../../../../config/theme/theme.dart';
import '../widgets/first_question_vissible_widget.dart';
import '../widgets/container_start_counter_widget.dart';
import '../widgets/second_vissible_question_widget.dart';
import '../widgets/third_vissible_question_widget.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_pages/my_app_scaffold_page.dart';
import '../../../../../common_ui/common_widgets/alerts/show_snackbar.dart';
import '../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';

class QuestionsAntigenPage extends StatelessWidget {
  const QuestionsAntigenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    return MyAppScaffold(
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
      bottomNavigationBar: ContainerStartCounterWidget(
          numberPageText: "2",
          valueLinear: 0.34,
          widgetButton: buttonContinue(context),
          textContainer: "self_t_linear_text"),
      children: [
        SizedBox(height: height * 0.02),
        const FirstVissibleQuestionWidget(),
        SizedBox(height: height * 0.015),
        const SecondVissibleQuestionWidget(),
        SizedBox(height: height * 0.015),
        const ThirdVissibleQuestionWidget(),
        SizedBox(height: height * 0.015),
        const FourQuestionWidget()
      ],
    );
  }

  Widget buttonContinue(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return BlocBuilder<AntigenTestBloc, AntigenTestState>(
      builder: (context, state) {
        return MainButtonWidget(
            width: width * 0.920,
            height: height * 0.053,
            borderRadiusButton: 30,
            buttonString: "self_t_button",
            textColor: wColor.mapColors["P01"],
            buttonColor: validateQuestion(state)
                ? wColor.mapColors["500BASE"]
                : wColor.mapColors["N300"],
            borderColor: validateQuestion(state)
                ? wColor.mapColors["500BASE"]
                : wColor.mapColors["N300"],
            onPressed: () {
              validateQuestion(state)
                  ? Navigator.pushNamed(context, "instructionPage")
                  : showSnackBar(
                      context, 'It is mandatory to fill all the fields');
            });
      },
    );
  }

  bool validateQuestion(AntigenTestState state) {
    if (validateQuestionOne(state) &&
        validateQuestionTwo(state) &&
        validateQuestionSeven(state) && 
        state.question6!.value.isNotEmpty &&
        
        state.vaccines!.isNotEmpty &&
        state.question11!.value.isNotEmpty &&
        state.question12!.value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool validateQuestionOne(AntigenTestState state) {
    if (state.question1!.value.isNotEmpty && state.question1!.value == 'Yes') {
      if (state.question2!.value.isNotEmpty &&
          state.question3!.value.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
    if (state.question1!.value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool validateQuestionTwo(AntigenTestState state) {
    if (state.question4!.value.isNotEmpty && state.question4!.value == 'Yes') {
      if (state.question5!.value.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
    if (state.question4!.value.isNotEmpty && state.question4!.value == 'No') {
      return true;
    } else {
      return false;
    }
  }

  bool validateQuestionSeven (AntigenTestState state ){
    if (state.question7!.value.isNotEmpty && (state.question7!.value == 'Yes, 1 Dose' || state.question7!.value == 'Yes, 2 Doses' ||state.question7!.value == 'Yes, 3 Doses' || state.question7!.value == 'Yes, 4 Doses' ) ){
      if (state.question8!.value.isNotEmpty && state.question9!.value.isNotEmpty){
        return true;
        
      }else {
        return false;
      }
    }
      if (state.question7!.value.isNotEmpty && state.question7!.value == 'No') {
        return true;
      }else{
        return false;
      }
  }
  
}
