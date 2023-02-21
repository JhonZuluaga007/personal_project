import 'package:flutter/material.dart';
import 'dart:async';

import '../../../../../../icons/icons.dart';
import '../../../../../../config/theme/theme.dart';
import '../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../../antigen/presentation/ui/widgets/container_start_counter_widget.dart';

class StartCounterPage extends StatefulWidget {
  final int? timerValue;
  final double valueLinear;
  final int maxValueLinear;

  const StartCounterPage(
      {super.key,
      this.valueLinear = 0.68,
      this.maxValueLinear = 6,
      this.timerValue});

  @override
  State<StartCounterPage> createState() => _StartCounterPageState();
}

class _StartCounterPageState extends State<StartCounterPage> {
  late Duration duration = Duration(minutes: widget.timerValue ?? 15);
  late Duration startTimer = Duration(minutes: widget.timerValue ?? 15);
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "instructionPage");
            timer?.cancel();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.24),
            Center(child: startCounter()),
          ],
        ),
      ),
      bottomNavigationBar: ContainerStartCounterWidget(
          numberPageText: "4",
          valueLinear: widget.valueLinear,
          widgetButton: buildButtons(),
          textContainer: "start_counter_text_finish_linear"),
    );
  }

  Widget buildButtons() {
    final wColor = ThemesIdx20();

    final isRunning = timer == null ? false : timer!.isActive;

    return Column(
      children: [
        isRunning
            // ignore: dead_code
            ? buildButtonsRunning()
            : MainButtonWidget(
                buttonString: "start_counter_text_button_start_timer",
                textColor: wColor.mapColors["S800"],
                buttonColor: wColor.mapColors["P01"],
                borderColor: wColor.mapColors["S800"],
                onPressed: () {
                  startTime();
                }),
      ],
    );
  }

  Widget buildButtonsRunning() {
    final width = MediaQuery.of(context).size.width;
    final wColor = ThemesIdx20();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MainButtonWidget(
            width: width * 0.3,
            buttonString: "start_counter_text_button_pause",
            textColor: wColor.mapColors["S800"],
            borderColor: wColor.mapColors["S800"],
            buttonColor: wColor.mapColors["P01"],
            onPressed: () {
              pauseTime();
            }),
        MainButtonWidget(
            width: width * 0.3,
            buttonString: "start_counter_text_button_reset",
            textColor: wColor.mapColors["S800"],
            borderColor: wColor.mapColors["S800"],
            buttonColor: wColor.mapColors["P01"],
            onPressed: () {
              resetTime();
            }),
        MainButtonWidget(
            width: width * 0.3,
            buttonString: "start_counter_text_button_skip_timer",
            textColor: wColor.mapColors["S800"],
            borderColor: wColor.mapColors["S800"],
            buttonColor: wColor.mapColors["P01"],
            onPressed: () {
              popUpSkyTimer(context);
            })
      ],
    );
  }

  void startTime() {
    setState(() {
      timer =
          Timer.periodic(const Duration(seconds: 1), (timer) => decreaseTime());
    });
  }

  void decreaseTime() {
    setState(() {
      late int decreaseTime = -1;

      final seconds = duration.inSeconds + decreaseTime;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void pauseTime() {
    setState(() {
      timer?.cancel();
    });
  }

  void resetTime() {
    setState(() {
      duration = Duration(seconds: startTimer.inSeconds);
    });
  }

  Widget buildTime() {
    final height = MediaQuery.of(context).size.height;

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Column(
      children: [
        SizedBox(height: height * 0.070),
        Text(
          "$minutes:$seconds",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 73, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: height * 0.019),
        const TextWidget(
          text: "start_counter_text_1",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget startCounter() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return SizedBox(
      width: width * 0.62,
      height: height * 0.28,
      child: Stack(fit: StackFit.expand, children: [
        CircularProgressIndicator(
          value: duration.inSeconds.toDouble() / startTimer.inSeconds,
          valueColor: AlwaysStoppedAnimation(wColor.mapColors["Pink"]!),
          strokeWidth: 21,
          backgroundColor: wColor.mapColors["T100"],
        ),
        Center(child: buildTime())
      ]),
    );
  }
}

Future popUpSkyTimer(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final wColor = ThemesIdx20();

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.049, vertical: height * 0.052),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(IconsFolderCovid.popUpSkyTimer),
                      SizedBox(height: height * 0.031),
                      TextWidget(
                        text: "popUp_text_title",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: wColor.mapColors["S800"],
                        ),
                      ),
                      SizedBox(height: height * 0.011),
                      TextWidget(
                        text: "popUp_text_description",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: wColor.mapColors["S600"],
                        ),
                      ),
                      SizedBox(height: height * 0.044),
                      MainButtonWidget(
                          buttonString: "popUp_button_text",
                          textColor: wColor.mapColors["P01"],
                          buttonColor: wColor.mapColors["S800"],
                          borderColor: wColor.mapColors["S800"],
                          onPressed: () {
                            Navigator.pushNamed(context, "uploadResult");
                          }),
                      SizedBox(height: height * 0.012),
                      MainButtonWidget(
                          buttonString: "popUp_button_text_1",
                          buttonColor: wColor.mapColors["P01"],
                          textColor: wColor.mapColors["S800"],
                          borderColor: wColor.mapColors["S800"],
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ]),
              )
            ]);
      });
}
