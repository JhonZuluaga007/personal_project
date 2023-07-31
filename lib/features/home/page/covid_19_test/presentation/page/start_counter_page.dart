// import 'dart:async';
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../../../config/helpers/navigator_key.dart';
// import '../../../../../../icons/icons.dart';
// import '../../../../../../config/theme/theme.dart';
// import '../../../../../../common_ui/common_widgets/text/text_widget.dart';
// import '../../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
// import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';
// import '../../../../../antigen/presentation/ui/widgets/container_start_counter_widget.dart';
// import '../widgets/timer_model_widget.dart';

// class StartCounterPage extends StatefulWidget {
//   final int? timerValue;
//   final double valueLinear;
//   final int maxValueLinear;

//   const StartCounterPage(
//       {super.key,
//       this.valueLinear = 0.68,
//       this.maxValueLinear = 6,
//       this.timerValue});

//   @override
//   State<StartCounterPage> createState() => _StartCounterPageState();
// }

// class _StartCounterPageState extends State<StartCounterPage>
//     with WidgetsBindingObserver {
//   late Duration duration;
//   late Duration startTimer = duration;
//   Timer? timer;
//   late bool isPauseTimer = false;
//   late bool beginTimer = false;
//   late AntigenTestBloc antigenBloc;
//   DateTime? appResumedTime;
//   DateTime? appPausedTime;
//   // Agregar una clave única para identificar el temporizador y el estado de pausa en SharedPreferences
//   static const String timerKey = "timer_duration";
//   static const String isPausedKey = "timer_is_paused";
//   bool isFirstTime = true;
//   bool timeUpdatedInBackground = false;
//   // Guardar la duración del temporizador y el estado de pausa en SharedPreferences
//   void _saveTimerData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt(timerKey, duration.inSeconds);
//     prefs.setBool(isPausedKey, isPauseTimer);
//   }
// //TODO WORKING

//   // void _clearTimerData() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   prefs.remove(timerKey);
//   //   prefs.remove(isPausedKey);
//   // }
// //TODO WORKING
//   // void startTime(BuildContext context) {
// final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;

//   //   setState(() {
//   //     if (!beginTimer) {
//   //       duration = Duration(minutes: stateAntigen.testTime ?? 15);
//   //       _saveTimerData(); // Save the initial timer value in SharedPreferences
//   //     }
//   //     if (isPauseTimer) {
//   //       isPauseTimer = false;
//   //     }
//   //     beginTimer = true;
//   //     timer = Timer.periodic(
//   //         const Duration(seconds: 1), (timer) => decreaseTime(context));
//   //   });
//   // }

//   //TODO TESTING

//   // void startTime(BuildContext context) {
//   //   final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;
//   //   if (!timerModel.isRunning) {
//   //     timerModel.start();
//   //   }
//   // }

//   // void pauseTime() {
//   timerModel.pause();
//   //   antigenBloc
//   //       .add(AntigenTestTimeEvent(testTime: timerModel.remainingMinutes));
//   // }

//   // void resetTime() {
//   //   timerModel.stop();
//   // }

//   @override
//   void initState() {
//     antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
//     final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;
//     duration = Duration(minutes: stateAntigen.testTime ?? 15);
//     startTimer = Duration(minutes: stateAntigen.testTime ?? 15);
//     timerModel = TimerModel(stateAntigen.testTime ?? 15);
//     WidgetsBinding.instance.addObserver(this);

//     super.initState();
//   }
// //TODO WORKING

//   // Duration _calculateRemainingTime(int secondsElapsedInBackground) {
//   //   final seconds = duration.inSeconds - secondsElapsedInBackground;
//   //   return Duration(seconds: seconds);
//   // }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused ||
//         state == AppLifecycleState.inactive) {
//       context.read<TimerModel>().pause();
//     } else if (state == AppLifecycleState.resumed) {
//       context.read<TimerModel>().resume();
//     }
//     if (NavigatorKey.navigatorKey.currentState != null) {
//       if (BlocProvider.of<AntigenTestBloc>(
//                   NavigatorKey.navigatorKey.currentState!.context)
//               .state
//               .testTime ==
//           0) {
//         openSoundsNotifications();
//       }
//     }
//     super.didChangeAppLifecycleState(state);
//   }

// //TODO WORKING METHODS
// // Método para calcular el tiempo transcurrido en segundo plano y actualizar el temporizador
// void _calculateElapsedTimeInBackground() {
//   final timeNow = DateTime.now();
//   if (appPausedTime != null && beginTimer && !timeUpdatedInBackground) {
//     final durationPaused = timeNow.difference(appPausedTime!);
//     final secondsElapsedInBackground = durationPaused.inSeconds;
//     final remainingTime = _calculateRemainingTime(secondsElapsedInBackground);
//     setState(() {
//       duration = remainingTime;
//     });
// timeUpdatedInBackground = true;
//   }
// }

// @override
// void didChangeAppLifecycleState(AppLifecycleState state) {
//   if (state == AppLifecycleState.paused ||
//       state == AppLifecycleState.inactive) {
// _saveTimerData();
// La aplicación se pone en pausa

//     appPausedTime = DateTime.now();
//   } else if (state == AppLifecycleState.resumed) {
//     // La aplicación se reanuda
//     _calculateElapsedTimeInBackground();
//     if (beginTimer) {
//       // Reanudamos el temporizador solo si estaba corriendo antes de ponerse en segundo plano
//       if (!isPauseTimer) {
//         timer?.cancel();
//         timer = Timer.periodic(
//             const Duration(seconds: 1), (timer) => decreaseTime(context));
//       }
//     }
// if (NavigatorKey.navigatorKey.currentState != null) {
//   if (BlocProvider.of<AntigenTestBloc>(
//               NavigatorKey.navigatorKey.currentState!.context)
//           .state
//           .testTime ==
//       0) {
//     openSoundsNotifications();
//   }
//     }
//   }
//   super.didChangeAppLifecycleState(state);
// }

//   void openSoundsNotifications() {
//     // _clearTimerData();
//     AssetsAudioPlayer.newPlayer().open(
//       Audio("assets/sounds/alarmp3.mp3"),
//       showNotification: false,
//     );
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     timer!.cancel();
//     // _clearTimerData();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final wColor = ThemesIdx20();
//     final ScrollController scrollControllerCounter = ScrollController();
// final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;

//     return ChangeNotifierProvider(
//       create: (_) => TimerModel(stateAntigen.testTime ?? 15),
//       builder: (context, _) {
//         final _timerModel = context.watch<TimerModel>();
//         return Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context, "instructionPage");
//                 timer?.cancel();
//               },
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: wColor.mapColors["S800"],
//               ),
//             ),
//             centerTitle: true,
//             title: TextWidget(
//               text: "test_info_screen_text_one",
//               style: TextStyle(
//                   fontSize: 20,
//                   color: wColor.mapColors["S800"],
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: -0.2),
//             ),
//             backgroundColor: wColor.mapColors["P01"],
//             elevation: 4,
//           ),
//           body: SingleChildScrollView(
//             controller: scrollControllerCounter,
//             physics: ClampingScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: height * 0.2),
//                 Center(child: startCounter(_timerModel)),
//               ],
//             ),
//           ),
//           bottomNavigationBar: ContainerStartCounterWidget(
//               numberPageText: "4",
//               valueLinear: widget.valueLinear,
//               widgetButton: buildButtons(),
//               textContainer: "start_counter_text_finish_linear"),
//         );
//       },
//     );
//   }

//   Widget buildButtons() {
//     final wColor = ThemesIdx20();
//     return Column(
//       children: [
//         timerModel.isRunning
//             ? buildButtonsRunning()
//             : MainButtonWidget(
//                 buttonString: "start_counter_text_button_start_timer",
//                 textColor: wColor.mapColors["S800"],
//                 buttonColor: wColor.mapColors["P01"],
//                 borderColor: wColor.mapColors["S800"],
//                 onPressed: () {
//                   setState(() {
//                     startTime(context);
//                   });
//                 }),
// beginTimer
//     ? buildButtonsRunning()
//     : MainButtonWidget(
//         buttonString: "start_counter_text_button_start_timer",
//         textColor: wColor.mapColors["S800"],
//         buttonColor: wColor.mapColors["P01"],
//         borderColor: wColor.mapColors["S800"],
//         onPressed: () {
//           setState(() {
//             // startTime(context);
//             timerModel.start();
//           });
//         }),
//       ],
//     );
//   }

//   Widget buildButtonsRunning() {
//     final width = MediaQuery.of(context).size.width;
//     final wColor = ThemesIdx20();

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         MainButtonWidget(
//             width: width * 0.3,
//             buttonString: beginTimer
//                 ? "start_counter_text_button_pause"
//                 : "start_counter_text_button_continue",
//             textColor: wColor.mapColors["S800"],
//             borderColor: wColor.mapColors["S800"],
//             buttonColor: wColor.mapColors["P01"],
//             onPressed: () {
//               pauseTime();
//             }),
//         MainButtonWidget(
//             width: width * 0.3,
//             buttonString: "start_counter_text_button_reset",
//             textColor: wColor.mapColors["S800"],
//             borderColor: wColor.mapColors["S800"],
//             buttonColor: wColor.mapColors["P01"],
//             onPressed: () {
//               resetTime();
//             }),
//         MainButtonWidget(
//             width: width * 0.3,
//             buttonString: "start_counter_text_button_skip_timer",
//             textColor: wColor.mapColors["S800"],
//             borderColor: wColor.mapColors["S800"],
//             buttonColor: wColor.mapColors["P01"],
//             onPressed: () {
//               popUpSkyTimer(context);
//             })
//       ],
//     );

//   }

// //TEST
// void startTime(BuildContext context) {
//   // El temporizador se inicia automáticamente al llamar a timerModel.start()
//   // No necesitas esta función si usas TimerModel para gestionar el tiempo.
// }
// void pauseTime() {
//   timerModel.pause();
//   // Resto del código...
// }

//   void decreaseTime(BuildContext context) async {
//     late int decreaseTime = -1;

//     final seconds = duration.inSeconds + decreaseTime;
//     if (seconds < 0) {
//       beginTimer = false;
//       timer?.cancel();
//       openSoundsNotifications();
//       Navigator.pushNamed(context, "uploadResult");
//     } else {
//       duration = Duration(seconds: seconds);
//     }
//     setState(() {});
//   }
// //TODO WORKING METHODS
// void pauseTime() {
//   setState(() {
//     isPauseTimer = true;
//     beginTimer = false;
//     timer?.cancel();
//   });
//   antigenBloc.add(AntigenTestTimeEvent(testTime: duration.inMinutes));
// }

// void resetTime() {
//   setState(() {
//     duration = Duration(seconds: startTimer.inSeconds);
//   });
// }

//   Widget buildTime() {
//     final height = MediaQuery.of(context).size.height;

//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     // final minutes = twoDigits(duration.inMinutes.remainder(60));
//     // final seconds = twoDigits(duration.inSeconds.remainder(60));
//     final minutes = twoDigits(timerModel.remainingMinutes.remainder(60));
//     final seconds = twoDigits(timerModel.duration.inSeconds.remainder(60));
//     final ScrollController scrollControllerTimer = ScrollController();

//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       controller: scrollControllerTimer,
//       physics: ClampingScrollPhysics(),
//       child: Column(
//         children: [
//           SizedBox(height: height * 0.003),
//           Text(
//             "$minutes:$seconds",
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w400),
//           ),
//           SizedBox(height: height * 0.019),
//           const TextWidget(
//             text: "start_counter_text_1",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
//           ),
//         ],
//       ),
//     );
//   }

// Widget startCounter(TimerModel timerModel) {
//   final width = MediaQuery.of(context).size.width;
//   final height = MediaQuery.of(context).size.height;
//   final wColor = ThemesIdx20();

//   return SizedBox(
//     width: width * 0.62,
//     height: height * 0.34,
//     child: Stack(fit: StackFit.expand, children: [
//       CircularProgressIndicator(
//         value: timerModel.remainingMinutes / (widget.timerValue ?? 15),
//         valueColor: AlwaysStoppedAnimation(wColor.mapColors["Pink"]!),
//         strokeWidth: 21,
//         backgroundColor: Colors.grey[300],
//       ),
//       Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "${timerModel.remainingMinutes.toString().padLeft(2, '0')}:${(timerModel.duration.inSeconds % 60).toString().padLeft(2, '0')}",
//               style: TextStyle(fontSize: 70, fontWeight: FontWeight.w400),
//             ),
//             SizedBox(height: height * 0.019),
//             const TextWidget(
//               text: "start_counter_text_1",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
//             ),
//           ],
//         ),
//       ),
//     ]),
//   );
// }
// //TODO WORKING
// //   Widget startCounter() {
// //     final width = MediaQuery.of(context).size.width;
// //     final height = MediaQuery.of(context).size.height;
// //     final wColor = ThemesIdx20();

// //     return SizedBox(
// //       width: width * 0.62,
// //       height: height * 0.34,
// //       child: Stack(fit: StackFit.expand, children: [
// //         CircularProgressIndicator(
// //           value: duration.inSeconds / startTimer.inSeconds,
// //           valueColor: AlwaysStoppedAnimation(wColor.mapColors["Pink"]!),
// //           strokeWidth: 21,
// //           backgroundColor: Colors.grey[300],
// //         ),
// //         Center(child: buildTime())
// //       ]),
// //     );
// //   }
// // }

//   Future popUpSkyTimer(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final wColor = ThemesIdx20();
//     final ScrollController scrollController2 = ScrollController();

//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return SingleChildScrollView(
//             controller: scrollController2,
//             physics: ClampingScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             child: AlertDialog(
//                 elevation: 6,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8)),
//                 actions: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: width * 0.049, vertical: height * 0.052),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(IconsFolderCovid.popUpSkyTimer),
//                           SizedBox(height: height * 0.031),
//                           TextWidget(
//                             text: "popUp_text_title",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.w600,
//                               color: wColor.mapColors["S800"],
//                             ),
//                           ),
//                           SizedBox(height: height * 0.011),
//                           TextWidget(
//                             text: "popUp_text_description",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: wColor.mapColors["S600"],
//                             ),
//                           ),
//                           SizedBox(height: height * 0.044),
//                           MainButtonWidget(
//                               buttonString: "popUp_button_text",
//                               textColor: wColor.mapColors["P01"],
//                               buttonColor: wColor.mapColors["S800"],
//                               borderColor: wColor.mapColors["S800"],
//                               onPressed: () {
//                                 Navigator.pushNamed(context, "uploadResult");
//                               }),
//                           SizedBox(height: height * 0.012),
//                           MainButtonWidget(
//                               buttonString: "popUp_button_text_1",
//                               buttonColor: wColor.mapColors["P01"],
//                               textColor: wColor.mapColors["S800"],
//                               borderColor: wColor.mapColors["S800"],
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               }),
//                         ]),
//                   )
//                 ]),
//           );
//         });
//   }
// }

///TESTINGGG2222 WORK MED
///
///
//

// import 'dart:async';
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
// import '../../../../../../common_ui/common_widgets/text/text_widget.dart';
// import '../../../../../../config/helpers/navigator_key.dart';
// import '../../../../../../config/theme/theme.dart';
// import '../../../../../../icons/icons.dart';
// import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';
// import '../../../../../antigen/presentation/ui/widgets/container_start_counter_widget.dart';
// import '../widgets/timer_model_widget.dart';

// class StartCounterPage extends StatefulWidget {
//   final int? timerValue;
//   final double valueLinear;
//   final int maxValueLinear;

//   const StartCounterPage({
//     super.key,
//     this.valueLinear = 0.68,
//     this.maxValueLinear = 6,
//     this.timerValue,
//   });

//   @override
//   State<StartCounterPage> createState() => _StartCounterPageState();
// }

// class _StartCounterPageState extends State<StartCounterPage>
//     with WidgetsBindingObserver {
//   late Duration duration;
//   late Timer timer;
//   bool isPauseTimer = false;
//   bool beginTimer = false;
//   late AntigenTestBloc antigenBloc;
//   DateTime? appResumedTime;
//   DateTime? appPausedTime;
//   static const String timerKey = "timer_duration";
//   static const String isPausedKey = "timer_is_paused";
//   bool timeUpdatedInBackground = false;
//   late TimerModel timerModel;
//   DateTime? _pauseTime;
//   void _saveTimerData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt(timerKey, duration.inSeconds);
//     prefs.setBool(isPausedKey, isPauseTimer);
//   }

//   @override
//   void initState() {
//     antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
//     final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;
//     duration = Duration(minutes: stateAntigen.testTime ?? 15);
//     // timer = Timer(duration);
//     timerModel =
//         TimerModel(duration.inMinutes); // Crear instancia de TimerModel
//     WidgetsBinding.instance.addObserver(this);
//     super.initState();
//   }

//   Duration _calculateRemainingTime(int secondsElapsedInBackground) {
//     final seconds = duration.inSeconds - secondsElapsedInBackground;
//     return Duration(seconds: seconds);
//   }

//   void _calculateElapsedTimeInBackground() {
//     final timeNow = DateTime.now();
//     if (appPausedTime != null && beginTimer && !timeUpdatedInBackground) {
//       final durationPaused = timeNow.difference(appPausedTime!);
//       final secondsElapsedInBackground = durationPaused.inSeconds;
//       final remainingTime = _calculateRemainingTime(secondsElapsedInBackground);
//       setState(() {
//         duration = remainingTime;
//       });
//       timeUpdatedInBackground = true;
//     }
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused ||
//         state == AppLifecycleState.inactive) {
//       _saveTimerData();
//       appPausedTime = DateTime.now();
//     } else if (state == AppLifecycleState.resumed) {
//       _calculateElapsedTimeInBackground();
//       if (beginTimer) {
//         if (!isPauseTimer) {
//           timer.cancel();
//           timer = Timer.periodic(
//             const Duration(seconds: 1),
//             (timer) => decreaseTime(context),
//           );
//         }
//       }
//       if (NavigatorKey.navigatorKey.currentState != null) {
//         if (BlocProvider.of<AntigenTestBloc>(
//                     NavigatorKey.navigatorKey.currentState!.context)
//                 .state
//                 .testTime ==
//             0) {
//           openSoundsNotifications();
//         }
//       }
//     }
//     super.didChangeAppLifecycleState(state);
//   }

//   void openSoundsNotifications() {
//     AssetsAudioPlayer.newPlayer().open(
//       Audio("assets/sounds/alarmp3.mp3"),
//       showNotification: false,
//     );
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     timer.cancel();

//     super.dispose();
//   }

//   void decreaseTime(BuildContext context) {
//     setState(() {
//       final decreaseTime = -1;
//       final seconds = duration.inSeconds + decreaseTime;
//       if (seconds < 0) {
//         beginTimer = false;
//         timer.cancel();
//         openSoundsNotifications();
//         Navigator.pushNamed(context, "uploadResult");
//       } else {
//         duration = Duration(seconds: seconds);
//       }
//     });
//   }

//   void resumeTime() {
//     final timerModel = Provider.of<TimerModel>(context, listen: false);
//     if (!timerModel.isRunning && _pauseTime != null) {
//       final pausedDuration = DateTime.now().difference(_pauseTime!);
//       _pauseTime = null; // Al reanudar, borramos el valor de _pauseTime
//       duration += pausedDuration;
//       setState(() {
//         isPauseTimer = false;
//       });
//       timerModel.resume();
//     }
//   }

//   void startTime(BuildContext context) {
//     final timerModel = Provider.of<TimerModel>(context, listen: false);
//     final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;

//     if (!timerModel.isRunning) {
//       duration = Duration(minutes: stateAntigen.testTime ?? 15);
//       _saveTimerData();
//     }

//     if (isPauseTimer) {
//       isPauseTimer = false;
//     }

//     setState(() {
//       beginTimer = true;
//     });

//     if (!timerModel.isRunning) {
//       timerModel.start();
//     }
//   }

//   void pauseTime() {
//     final timerModel = Provider.of<TimerModel>(context, listen: false);
//     timerModel.pause();
//     setState(() {
//       isPauseTimer = true;
//     });
//     antigenBloc.add(AntigenTestTimeEvent(testTime: duration.inMinutes));
//   }

//   void resetTime() {
//     final timerModel = Provider.of<TimerModel>(context, listen: false);
//     timerModel.resetTime(context);
//     setState(() {
//       duration = timerModel.duration;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final wColor = ThemesIdx20();
//     final ScrollController scrollControllerCounter = ScrollController();
//     final timerModel = context.watch<TimerModel>();
//     return ChangeNotifierProvider.value(
//       value: timerModel,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context, "instructionPage");
//               timer.cancel();
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: wColor.mapColors["S800"],
//             ),
//           ),
//           centerTitle: true,
//           title: TextWidget(
//             text: "test_info_screen_text_one",
//             style: TextStyle(
//               fontSize: 20,
//               color: wColor.mapColors["S800"],
//               fontWeight: FontWeight.w600,
//               letterSpacing: -0.2,
//             ),
//           ),
//           backgroundColor: wColor.mapColors["P01"],
//           elevation: 4,
//         ),
//         body: SingleChildScrollView(
//           controller: scrollControllerCounter,
//           physics: ClampingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: height * 0.2),
//               // Mostrar el temporizador dentro del CircularProgressIndicator
//               Center(
//                 child: startCounter(timerModel),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: ContainerStartCounterWidget(
//           numberPageText: "4",
//           valueLinear: widget.valueLinear,
//           widgetButton: buildButtons(),
//           textContainer: "start_counter_text_finish_linear",
//         ),
//       ),
//     );
//   }

//   Widget startCounter(TimerModel timerModel) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final wColor = ThemesIdx20();

//     return SizedBox(
//       width: width * 0.62,
//       height: height * 0.34,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           CircularProgressIndicator(
//             value: timerModel.remainingMinutes / (widget.timerValue ?? 15),
//             valueColor: AlwaysStoppedAnimation(wColor.mapColors["Pink"]!),
//             strokeWidth: 21,
//             backgroundColor: Colors.grey[300],
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "${timerModel.remainingMinutes.toString().padLeft(2, '0')}:${(timerModel.duration.inSeconds % 60).toString().padLeft(2, '0')}",
//                   style: TextStyle(fontSize: 70, fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(height: height * 0.019),
//                 const TextWidget(
//                   text: "start_counter_text_1",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildTime() {
//     final height = MediaQuery.of(context).size.height;
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     final ScrollController scrollControllerTimer = ScrollController();

//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       controller: scrollControllerTimer,
//       physics: ClampingScrollPhysics(),
//       child: Column(
//         children: [
//           SizedBox(height: height * 0.003),
//           Text(
//             "$minutes:$seconds",
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w400),
//           ),
//           SizedBox(height: height * 0.019),
//           const TextWidget(
//             text: "start_counter_text_1",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildButtonsRunning() {
//     final width = MediaQuery.of(context).size.width;
//     final wColor = ThemesIdx20();
//     final timerModel = context.watch<TimerModel>();
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         MainButtonWidget(
//           width: width * 0.3,
//           buttonString: timerModel.isRunning
//               ? "start_counter_text_button_pause"
//               : "start_counter_text_button_continue",
//           textColor: wColor.mapColors["S800"],
//           borderColor: wColor.mapColors["S800"],
//           buttonColor: wColor.mapColors["P01"],
//           onPressed: () {
//             if (timerModel.isRunning) {
//               pauseTime();
//               print('pausar');
//               print(timerModel.isRunning);
//             } else {
//               // startTime(context);
//               resumeTime();
//             }
//           },
//         ),
//         MainButtonWidget(
//           width: width * 0.3,
//           buttonString: "start_counter_text_button_reset",
//           textColor: wColor.mapColors["S800"],
//           borderColor: wColor.mapColors["S800"],
//           buttonColor: wColor.mapColors["P01"],
//           onPressed: () {
//             resetTime();
//             print('reset');
//           },
//         ),
//         MainButtonWidget(
//           width: width * 0.3,
//           buttonString: "start_counter_text_button_skip_timer",
//           textColor: wColor.mapColors["S800"],
//           borderColor: wColor.mapColors["S800"],
//           buttonColor: wColor.mapColors["P01"],
//           onPressed: () {
//             popUpSkyTimer(context);
//           },
//         ),
//       ],
//     );
//   }

//   Widget buildButtons() {
//     final wColor = ThemesIdx20();
//     final timerModel = context.watch<TimerModel>();
//     return Column(
//       children: [
//         if (!timerModel.isRunning || isPauseTimer)
//           MainButtonWidget(
//             buttonString: "start_counter_text_button_start_timer",
//             textColor: wColor.mapColors["S800"],
//             buttonColor: wColor.mapColors["P01"],
//             borderColor: wColor.mapColors["S800"],
//             onPressed: () {
//               startTime(context);
//             },
//           ),
//         if (timerModel.isRunning && !isPauseTimer)
//           buildButtonsRunning(), // Mostrar los botones "Pause", "Reset" y "Skip Timer" si el temporizador está en marcha
//       ],
//     );
//   }

//   Future popUpSkyTimer(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final wColor = ThemesIdx20();
//     final ScrollController scrollController2 = ScrollController();

//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return SingleChildScrollView(
//           controller: scrollController2,
//           physics: ClampingScrollPhysics(),
//           scrollDirection: Axis.vertical,
//           child: AlertDialog(
//             elevation: 6,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             actions: [
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: width * 0.049,
//                   vertical: height * 0.052,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(IconsFolderCovid.popUpSkyTimer),
//                     SizedBox(height: height * 0.031),
//                     TextWidget(
//                       text: "popUp_text_title",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.w600,
//                         color: wColor.mapColors["S800"],
//                       ),
//                     ),
//                     SizedBox(height: height * 0.011),
//                     TextWidget(
//                       text: "popUp_text_description",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                         color: wColor.mapColors["S600"],
//                       ),
//                     ),
//                     SizedBox(height: height * 0.044),
//                     MainButtonWidget(
//                       buttonString: "popUp_button_text",
//                       textColor: wColor.mapColors["P01"],
//                       buttonColor: wColor.mapColors["S800"],
//                       borderColor: wColor.mapColors["S800"],
//                       onPressed: () {
//                         Navigator.pushNamed(context, "uploadResult");
//                       },
//                     ),
//                     SizedBox(height: height * 0.012),
//                     MainButtonWidget(
//                       buttonString: "popUp_button_text_1",
//                       buttonColor: wColor.mapColors["P01"],
//                       textColor: wColor.mapColors["S800"],
//                       borderColor: wColor.mapColors["S800"],
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
///FINISH TEST2
///
///
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_foreground_plugin/flutter_foreground_plugin.dart';

import '../../../../../../common_ui/common_widgets/buttons/main_button_widget.dart';
import '../../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../../config/theme/theme.dart';
import '../../../../../../icons/icons.dart';
import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';
import '../../../../../antigen/presentation/ui/widgets/container_start_counter_widget.dart';
import '../widgets/timer_model_widget.dart';

// class StartCounterPage extends StatefulWidget {
//   final int? timerValue;
//   final double valueLinear;
//   final int maxValueLinear;

//   const StartCounterPage({
//     super.key,
//     this.valueLinear = 0.68,
//     this.maxValueLinear = 6,
//     this.timerValue,
//   });

//   @override
//   State<StartCounterPage> createState() => _StartCounterPageState();
// }

// class _StartCounterPageState extends State<StartCounterPage>
//     with WidgetsBindingObserver, TickerProviderStateMixin {
//   late Duration duration;
//   late Timer timer;
//   bool isPauseTimer = false;
//   bool beginTimer = false;
//   late AntigenTestBloc antigenBloc;
//   DateTime? appResumedTime;
//   DateTime? appPausedTime;
//   static const String timerKey = "timer_duration";
//   static const String isPausedKey = "timer_is_paused";
//   bool timeUpdatedInBackground = false;
//   void _saveTimerData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt(timerKey, duration.inSeconds);
//     prefs.setBool(isPausedKey, isPauseTimer);
//   }

//   @override
//   void initState() {
//     antigenBloc = BlocProvider.of<AntigenTestBloc>(context);
//     final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;
//     duration = Duration(minutes: stateAntigen.testTime ?? 15);
//     // timerModel = TimerModel(duration.inMinutes);
//     timer = Timer.periodic(
//       const Duration(seconds: 1),
//       (_) => decreaseTime(context),
//     );
// // Inicializar el Ticker
//     WidgetsBinding.instance.addObserver(this);
//     super.initState();
//   }
//   // Resto del código...

//   Duration _calculateRemainingTime(int secondsElapsedInBackground) {
//     final seconds = duration.inSeconds - secondsElapsedInBackground;
//     return Duration(seconds: seconds);
//   }

//   void _calculateElapsedTimeInBackground() {
//     final timeNow = DateTime.now();
//     if (appPausedTime != null && beginTimer && !timeUpdatedInBackground) {
//       final durationPaused = timeNow.difference(appPausedTime!);
//       final secondsElapsedInBackground = durationPaused.inSeconds;
//       final remainingTime = _calculateRemainingTime(secondsElapsedInBackground);
//       setState(() {
//         duration = remainingTime;
//       });
//       timeUpdatedInBackground = true;
//     }
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused ||
//         state == AppLifecycleState.inactive) {
//       _saveTimerData();
//       appPausedTime = DateTime.now();
//     } else if (state == AppLifecycleState.resumed) {
//       _calculateElapsedTimeInBackground();
//       if (beginTimer) {
//         if (!isPauseTimer) {
//           timer.cancel();
//           timer = Timer.periodic(
//             const Duration(seconds: 1),
//             (timer) => decreaseTime(context),
//           );
//         }
//       }
//     if (NavigatorKey.navigatorKey.currentState != null) {
// if (BlocProvider.of<AntigenTestBloc>(
//             NavigatorKey.navigatorKey.currentState!.context)
//         .state
//         .testTime ==
//     0) {
//   openSoundsNotifications();
// }
// }
//     }
//     super.didChangeAppLifecycleState(state);
//   }

//   void openSoundsNotifications() {
//     AssetsAudioPlayer.newPlayer().open(
//       Audio("assets/sounds/alarmp3.mp3"),
//       showNotification: false,
//     );
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     timer.cancel();

//     super.dispose();
//   }

//   void decreaseTime(BuildContext context) {
//     setState(() {
//       final decreaseTime = -1;
//       final seconds = duration.inSeconds + decreaseTime;
//       if (seconds < 0) {
//         beginTimer = false;
//         timer.cancel();
// openSoundsNotifications();
// Navigator.pushNamed(context, "uploadResult");
//       } else {
//         duration = Duration(seconds: seconds);
//       }
//     });
//   }

//   void startTime(BuildContext context) {
//     final timerModel = context.read<TimerModel>();
//     final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;

//     if (!timerModel.isRunning) {
//       duration = Duration(minutes: stateAntigen.testTime ?? 15);
//       _saveTimerData();
//     }

//     if (isPauseTimer) {
//       isPauseTimer = false;
//     }

//     setState(() {
//       beginTimer = true;
//     });

//     if (!timerModel.isRunning) {
//       timerModel.start();
//     }
//   }

//   void pauseTime() {
//     final timerModel = context.read<TimerModel>();
//     timerModel.pause(); // Pausar el temporizador
//     setState(() {
//       isPauseTimer = true;
//       beginTimer = false;
//     });
//     antigenBloc
//         .add(AntigenTestTimeEvent(testTime: timerModel.duration.inMinutes));
//   }

//   void resumeTime() {
//     final timerModel = context.read<TimerModel>();
//     timerModel.resume(); // Reanudar el temporizador
//     setState(() {
//       isPauseTimer = false;
//       beginTimer = true;
//     });
//   }

//   void resetTime() {
//     final timerModel = context.read<TimerModel>();
//     timerModel.resetTime(context);
//     setState(() {
//       duration = timerModel.duration;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final wColor = ThemesIdx20();
//     final timerModel = context.watch<TimerModel>();
//     final ScrollController scrollControllerCounter = ScrollController();
//     return ChangeNotifierProvider.value(
//       value: timerModel,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context, "instructionPage");
//               timer.cancel();
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: wColor.mapColors["S800"],
//             ),
//           ),
//           centerTitle: true,
//           title: TextWidget(
//             text: "test_info_screen_text_one",
//             style: TextStyle(
//               fontSize: 20,
//               color: wColor.mapColors["S800"],
//               fontWeight: FontWeight.w600,
//               letterSpacing: -0.2,
//             ),
//           ),
//           backgroundColor: wColor.mapColors["P01"],
//           elevation: 4,
//         ),
//         body: SingleChildScrollView(
//           controller: scrollControllerCounter,
//           physics: ClampingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: height * 0.2),
//               // Mostrar el temporizador dentro del CircularProgressIndicator
//               Center(
//                 child: startCounter(timerModel),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: ContainerStartCounterWidget(
//           numberPageText: "4",
//           valueLinear: widget.valueLinear,
//           widgetButton: buildButtons(),
//           textContainer: "start_counter_text_finish_linear",
//         ),
//       ),
//     );
//   }

//   Widget startCounter(TimerModel timerModel) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final wColor = ThemesIdx20();

//     return SizedBox(
//       width: width * 0.62,
//       height: height * 0.34,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           CircularProgressIndicator(
//             value: timerModel.remainingMinutes / (widget.timerValue ?? 15),
//             valueColor: AlwaysStoppedAnimation(wColor.mapColors["Pink"]!),
//             strokeWidth: 21,
//             backgroundColor: Colors.grey[300],
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "${timerModel.remainingMinutes.toString().padLeft(2, '0')}:${(timerModel.duration.inSeconds % 60).toString().padLeft(2, '0')}",
//                   style: TextStyle(fontSize: 70, fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(height: height * 0.019),
//                 const TextWidget(
//                   text: "start_counter_text_1",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildTime() {
//     final height = MediaQuery.of(context).size.height;
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     final ScrollController scrollControllerTimer = ScrollController();

//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       controller: scrollControllerTimer,
//       physics: ClampingScrollPhysics(),
//       child: Column(
//         children: [
//           SizedBox(height: height * 0.003),
//           Text(
//             "$minutes:$seconds",
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w400),
//           ),
//           SizedBox(height: height * 0.019),
//           const TextWidget(
//             text: "start_counter_text_1",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildButtonsRunning() {
//     final width = MediaQuery.of(context).size.width;
//     final wColor = ThemesIdx20();
//     final timerModel = context.read<TimerModel>();
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         MainButtonWidget(
//           width: width * 0.3,
//           buttonString: timerModel.isRunning
//               ? "start_counter_text_button_pause"
//               : "start_counter_text_button_continue",
//           textColor: wColor.mapColors["S800"],
//           borderColor: wColor.mapColors["S800"],
//           buttonColor: wColor.mapColors["P01"],
//           onPressed: () {
//             if (timerModel.isRunning) {
//               pauseTime();
//               print('pausar');
//               print(timerModel.isRunning);
//             } else {
//               // startTime(context);
//               resumeTime();
//             }
//           },
//         ),
//         MainButtonWidget(
//           width: width * 0.3,
//           buttonString: "start_counter_text_button_reset",
//           textColor: wColor.mapColors["S800"],
//           borderColor: wColor.mapColors["S800"],
//           buttonColor: wColor.mapColors["P01"],
//           onPressed: () {
//             resetTime();
//             print('reset');
//           },
//         ),
//         MainButtonWidget(
//           width: width * 0.3,
//           buttonString: "start_counter_text_button_skip_timer",
//           textColor: wColor.mapColors["S800"],
//           borderColor: wColor.mapColors["S800"],
//           buttonColor: wColor.mapColors["P01"],
//           onPressed: () {
//             popUpSkyTimer(context);
//           },
//         ),
//       ],
//     );
//   }

//   Widget buildButtons() {
//     final wColor = ThemesIdx20();
//     final timerModel = context.read<TimerModel>();
//     return Column(
//       children: [
//         if (!timerModel.isRunning || isPauseTimer)
//           MainButtonWidget(
//             buttonString: "start_counter_text_button_start_timer",
//             textColor: wColor.mapColors["S800"],
//             buttonColor: wColor.mapColors["P01"],
//             borderColor: wColor.mapColors["S800"],
//             onPressed: () {
//               startTime(context);
//             },
//           ),
//         if (timerModel.isRunning && !isPauseTimer)
//           buildButtonsRunning(), // Mostrar los botones "Pause", "Reset" y "Skip Timer" si el temporizador está en marcha
//       ],
//     );
//   }

// Future popUpSkyTimer(BuildContext context) {
//   final width = MediaQuery.of(context).size.width;
//   final height = MediaQuery.of(context).size.height;
//   final wColor = ThemesIdx20();
//   final ScrollController scrollController2 = ScrollController();

//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return SingleChildScrollView(
//         controller: scrollController2,
//         physics: ClampingScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         child: AlertDialog(
//           elevation: 6,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           actions: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: width * 0.049,
//                 vertical: height * 0.052,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(IconsFolderCovid.popUpSkyTimer),
//                   SizedBox(height: height * 0.031),
//                   TextWidget(
//                     text: "popUp_text_title",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w600,
//                       color: wColor.mapColors["S800"],
//                     ),
//                   ),
//                   SizedBox(height: height * 0.011),
//                   TextWidget(
//                     text: "popUp_text_description",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w400,
//                       color: wColor.mapColors["S600"],
//                     ),
//                   ),
//                   SizedBox(height: height * 0.044),
//                   MainButtonWidget(
//                     buttonString: "popUp_button_text",
//                     textColor: wColor.mapColors["P01"],
//                     buttonColor: wColor.mapColors["S800"],
//                     borderColor: wColor.mapColors["S800"],
//                     onPressed: () {
//                       Navigator.pushNamed(context, "uploadResult");
//                     },
//                   ),
//                   SizedBox(height: height * 0.012),
//                   MainButtonWidget(
//                     buttonString: "popUp_button_text_1",
//                     buttonColor: wColor.mapColors["P01"],
//                     textColor: wColor.mapColors["S800"],
//                     borderColor: wColor.mapColors["S800"],
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
// }

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
        context.read<TimerModel>().resume();
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
              timerModel.start();
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
              timerModel.resume();
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
