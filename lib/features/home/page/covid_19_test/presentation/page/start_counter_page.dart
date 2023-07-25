import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../config/helpers/navigator_key.dart';
import '../../../../../../icons/icons.dart';
import '../../../../../../config/theme/theme.dart';
import '../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';
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

class _StartCounterPageState extends State<StartCounterPage>
    with WidgetsBindingObserver {
  late Duration duration;
  late Duration startTimer = duration;
  Timer? timer;
  late bool isPauseTimer = false;
  late bool beginTimer = false;
  late AntigenTestBloc antigenBloc;
  DateTime? appResumedTime;
  DateTime? appPausedTime;
  // Agregar una clave única para identificar el temporizador y el estado de pausa en SharedPreferences
  static const String timerKey = "timer_duration";
  static const String isPausedKey = "timer_is_paused";
  bool isFirstTime = true;

  bool timeUpdatedInBackground = false;
  // Guardar la duración del temporizador y el estado de pausa en SharedPreferences
  void _saveTimerData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(timerKey, duration.inSeconds);
    prefs.setBool(isPausedKey, isPauseTimer);
  }

  void _clearTimerData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(timerKey);
    prefs.remove(isPausedKey);
  }

  void startTime(BuildContext context) {
    final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;

    setState(() {
      if (!beginTimer) {
        duration = Duration(minutes: stateAntigen.testTime ?? 15);
        _saveTimerData(); // Save the initial timer value in SharedPreferences
      }
      if (isPauseTimer) {
        isPauseTimer = false;
      }
      beginTimer = true;
      timer = Timer.periodic(
          const Duration(seconds: 1), (timer) => decreaseTime(context));
    });
  }

  @override
  void initState() {
    antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
    final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;
    duration = Duration(minutes: stateAntigen.testTime ?? 15);
    startTimer = Duration(minutes: stateAntigen.testTime ?? 15);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  Duration _calculateRemainingTime(int secondsElapsedInBackground) {
    final seconds = duration.inSeconds - secondsElapsedInBackground;
    return Duration(seconds: seconds);
  }

  // Método para calcular el tiempo transcurrido en segundo plano y actualizar el temporizador
  void _calculateElapsedTimeInBackground() {
    final timeNow = DateTime.now();
    if (appPausedTime != null && beginTimer && !timeUpdatedInBackground) {
      final durationPaused = timeNow.difference(appPausedTime!);
      final secondsElapsedInBackground = durationPaused.inSeconds;
      final remainingTime = _calculateRemainingTime(secondsElapsedInBackground);
      setState(() {
        duration = remainingTime;
      });
      timeUpdatedInBackground = true;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _saveTimerData();
      // La aplicación se pone en pausa

      appPausedTime = DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      // La aplicación se reanuda
      _calculateElapsedTimeInBackground();
      if (beginTimer) {
        // Reanudamos el temporizador solo si estaba corriendo antes de ponerse en segundo plano
        if (!isPauseTimer) {
          timer?.cancel();
          timer = Timer.periodic(
              const Duration(seconds: 1), (timer) => decreaseTime(context));
        }
      }
      if (NavigatorKey.navigatorKey.currentState != null) {
        if (BlocProvider.of<AntigenTestBloc>(
                    NavigatorKey.navigatorKey.currentState!.context)
                .state
                .testTime ==
            0) {
          openSoundsNotifications();
        }
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  void openSoundsNotifications() {
    _clearTimerData();
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/sounds/alarmp3.mp3"),
      showNotification: false,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    timer!.cancel();
    _clearTimerData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final ScrollController scrollControllerCounter = ScrollController();

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
        controller: scrollControllerCounter,
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.2),
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
    return Column(
      children: [
        beginTimer
            ? buildButtonsRunning()
            : MainButtonWidget(
                buttonString: "start_counter_text_button_start_timer",
                textColor: wColor.mapColors["S800"],
                buttonColor: wColor.mapColors["P01"],
                borderColor: wColor.mapColors["S800"],
                onPressed: () {
                  setState(() {
                    startTime(context);
                  });
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
            buttonString: beginTimer
                ? "start_counter_text_button_pause"
                : "start_counter_text_button_continue",
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

  void decreaseTime(BuildContext context) async {
    late int decreaseTime = -1;

    final seconds = duration.inSeconds + decreaseTime;
    if (seconds < 0) {
      beginTimer = false;
      timer?.cancel();
      openSoundsNotifications();
      Navigator.pushNamed(context, "uploadResult");
    } else {
      duration = Duration(seconds: seconds);
    }
    setState(() {});
  }

  void pauseTime() {
    setState(() {
      isPauseTimer = true;
      beginTimer = false;
      timer?.cancel();
    });
    antigenBloc.add(AntigenTestTimeEvent(testTime: duration.inMinutes));
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
    final ScrollController scrollControllerTimer = ScrollController();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: scrollControllerTimer,
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: height * 0.003),
          Text(
            "$minutes:$seconds",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: height * 0.019),
          const TextWidget(
            text: "start_counter_text_1",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget startCounter() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return SizedBox(
      width: width * 0.62,
      height: height * 0.34,
      child: Stack(fit: StackFit.expand, children: [
        CircularProgressIndicator(
          value: duration.inSeconds / startTimer.inSeconds,
          valueColor: AlwaysStoppedAnimation(wColor.mapColors["Pink"]!),
          strokeWidth: 21,
          backgroundColor: Colors.grey[300],
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
  final ScrollController scrollController2 = ScrollController();

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          controller: scrollController2,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: AlertDialog(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
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
              ]),
        );
      });
}
