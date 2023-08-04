import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../config/theme/theme.dart';
import '../../../../../../icons/icons.dart';
import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';
import '../../../../../antigen/presentation/ui/widgets/container_start_counter_widget.dart';
import '../widgets/timer_model_widget.dart';

class StartCounterPage extends StatefulWidget {
  final Duration? timerValue;
  final double valueLinear;
  final int maxValueLinear;

  const StartCounterPage({
    Key? key,
    this.valueLinear = 0.68,
    this.maxValueLinear = 6,
    this.timerValue,
  }) : super(key: key);

  @override
  State<StartCounterPage> createState() => _StartCounterPageState();
}

class _StartCounterPageState extends State<StartCounterPage>
    with WidgetsBindingObserver {
  final ScrollController scrollControllerCounter = ScrollController();

  late Duration startDuration;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      if (!context.read<TimerModel>().isPaused)
        context.read<TimerModel>().pause();
    }
    if (state == AppLifecycleState.resumed) {
      if (!context.read<TimerModel>().isPaused)
        context.read<TimerModel>().resume(context);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;

    return ChangeNotifierProvider(
      create: (_) => TimerModel(stateAntigen.testTime ?? 15),
      builder: (context, _) {
        final _timerModel =
            context.watch<TimerModel>(); // Obtener el TimerModel del provider
        // Actualizar la interfaz de usuario cuando el temporizador llega a 0 y se detiene
        startDuration = Duration(minutes: stateAntigen.testTime!);

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, "instructionPage");
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
                letterSpacing: -0.2,
              ),
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
                Center(child: startCounter(_timerModel)),
              ],
            ),
          ),
          bottomNavigationBar: ContainerStartCounterWidget(
            numberPageText: "4",
            valueLinear: widget.valueLinear,
            widgetButton: buildButtons(_timerModel),
            textContainer: "start_counter_text_finish_linear",
          ),
        );
      },
    );
  }

  Widget startCounter(TimerModel timerModel) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    String minutes = timerModel.remainingMinutes.toString().padLeft(2, '0');
    String seconds =
        (timerModel.duration.inSeconds % 60).toString().padLeft(2, '0');

    return SizedBox(
      width: width * 0.62,
      height: height * 0.34,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: timerModel.duration.inSeconds / startDuration.inSeconds,
            valueColor: AlwaysStoppedAnimation(wColor.mapColors["Pink"]!),
            strokeWidth: 21,
            backgroundColor: Colors.grey[300],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${minutes}:${seconds}",
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: height * 0.019),
                const TextWidget(
                  text: "start_counter_text_1",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtons(TimerModel timerModel) {
    final wColor = ThemesIdx20();

    return Column(
      children: [
        if (!timerModel.isRunning)
          MainButtonWidget(
            buttonString: "start_counter_text_button_start_timer",
            textColor: wColor.mapColors["S800"],
            buttonColor: wColor.mapColors["P01"],
            borderColor: wColor.mapColors["S800"],
            onPressed: () {
              timerModel.start(context);
            },
          ),
        if (timerModel.isRunning && !timerModel.isPaused)
          buildButtonsRunning(timerModel),
      ],
    );
  }

  Widget buildButtonsRunning(TimerModel timerModel) {
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
            if (timerModel.isRunning) {
              timerModel.pause();
              print('pausar');
              print(timerModel.isRunning);
            } else {
              timerModel.resume(context);
            }
          },
        ),
        MainButtonWidget(
          width: width * 0.3,
          buttonString: "start_counter_text_button_reset",
          textColor: wColor.mapColors["S800"],
          borderColor: wColor.mapColors["S800"],
          buttonColor: wColor.mapColors["P01"],
          onPressed: () {
            timerModel.resetTime(context);
            print('reset');
          },
        ),
        MainButtonWidget(
          width: width * 0.3,
          buttonString: "start_counter_text_button_skip_timer",
          textColor: wColor.mapColors["S800"],
          borderColor: wColor.mapColors["S800"],
          buttonColor: wColor.mapColors["P01"],
          onPressed: () {
            popUpSkyTimer(context);
          },
        ),
      ],
    );
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
              borderRadius: BorderRadius.circular(8),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.049,
                  vertical: height * 0.052,
                ),
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
                      },
                    ),
                    SizedBox(height: height * 0.012),
                    MainButtonWidget(
                      buttonString: "popUp_button_text_1",
                      buttonColor: wColor.mapColors["P01"],
                      textColor: wColor.mapColors["S800"],
                      borderColor: wColor.mapColors["S800"],
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
