import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/helpers/navigator_key.dart';
import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';

class TimerModel extends ChangeNotifier {
  Timer? _timer;
  late Duration _duration;
  bool _isPaused = false;
  bool _isRunning = false;
  DateTime? _pauseTime;

  TimerModel(int minutes) {
    _duration = Duration(minutes: minutes);
  }

  int get remainingMinutes => _duration.inMinutes;
  Duration get duration => _duration;
  bool get isPaused => _isPaused;
  bool get isRunning => _isRunning;

  void start() {
    if (_timer == null || !_isRunning) {
      _timer =
          Timer.periodic(const Duration(seconds: 1), (_) => _decreaseTime());
      _isRunning = true;
      _isPaused = false;
    }
  }

  void pause() {
    if (_isRunning && !_isPaused) {
      _isPaused = true;
      _isRunning = false;
      _pauseTime = DateTime.now();
      _timer?.cancel();
      notifyListeners();
    }
  }

  void resume() {
    if (_isPaused) {
      final pausedDuration = DateTime.now().difference(_pauseTime!);
      _isPaused = false;
      _isRunning = true;
      _duration += pausedDuration;
      _timer =
          Timer.periodic(const Duration(seconds: 1), (_) => _decreaseTime());
      notifyListeners();
    }
  }

  void stop() {
    _timer?.cancel();
    _isPaused = false;
    _isRunning = false;
    _pauseTime = null;
    _duration = Duration();
    notifyListeners();
    openSoundsNotifications();
    notifyListeners();
  }

  void resetTime(BuildContext context) {
    final stateAntigen = BlocProvider.of<AntigenTestBloc>(
            NavigatorKey.navigatorKey.currentState?.context ?? context)
        .state;
    _pauseTime = null;
    final testTime = stateAntigen.testTime ?? 15;
    _duration = Duration(minutes: testTime);
    notifyListeners();
  }

  void _decreaseTime() {
    if (_duration.inSeconds > 0) {
      _duration = Duration(seconds: _duration.inSeconds - 1);
      notifyListeners();
    } else {
      stop();
    }
  }

  void openSoundsNotifications() {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/sounds/alarmp3.mp3"),
      showNotification: false,
    );
  }
}

// import 'dart:async';
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';

// class TimerModel extends ChangeNotifier {
//   late Timer _timer;
//   late Duration _duration;
//   bool _isRunning = false;
//   bool _isPauseTimer = false;

//   TimerModel(int minutes) {
//     _duration = Duration(minutes: minutes);
//   }

//   Duration get duration => _duration;
//   bool get isRunning => _isRunning;
//   bool get isPauseTimer => _isPauseTimer;
//   set isPauseTimer(bool value) {
//     // Agregar el setter para isPauseTimer
//     _isPauseTimer = value;
//     notifyListeners();
//   }

//   int get remainingMinutes => _duration.inMinutes;
//   int get remainingSeconds => _duration.inSeconds % 60;

//   void start(BuildContext context) {
//     if (!_isRunning) {
//       _isRunning = true;
//       isPauseTimer = false;
//       _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//         if (_duration.inSeconds > 0) {
//           _duration = _duration - Duration(seconds: 1);
//           notifyListeners();
//         } else {
//           stop(context);
//         }
//       });
//       notifyListeners();
//     }
//   }

//   int _backgroundTime = 0;

//   // ... (código existente)

//   void updateBackgroundTime(int timeInSeconds) {
//     _backgroundTime = timeInSeconds;
//   }

//   // ... (código existente)

//   int get remainingSecondsWithBackgroundTime =>
//       _duration.inSeconds - _backgroundTime;

//   void pauseTime() {
//     if (_isRunning) {
//       _timer.cancel();
//       _isRunning = false;
//       _isPauseTimer = true;
//       notifyListeners();
//     }
//   }

//   void resumeTime(BuildContext context) {
//     if (!_isRunning && _isPauseTimer) {
//       _isRunning = true;
//       _isPauseTimer = false;
//       _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//         if (_duration.inSeconds > 0) {
//           _duration = _duration - Duration(seconds: 1);
//           notifyListeners();
//         } else {
//           stop(context);
//         }
//       });
//       notifyListeners();
//     }
//   }

//   void resetTime(BuildContext context) {
//     _timer.cancel();
//     _isRunning = false;
//     _isPauseTimer = false;
//     final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;
//     _duration = Duration(
//         minutes: stateAntigen.testTime ??
//             15); // Cambiar a 15 minutos si es necesario
//     notifyListeners();
//   }

//   void stop(BuildContext context) {
//     _timer.cancel();
//     _isRunning = false;
//     _isPauseTimer = false;
//     notifyListeners();

//     // Realiza la navegación aquí cuando el temporizador llega a 0
//     openSoundsNotifications();
//     Navigator.pushNamed(context, "uploadResult");
//   }

//   void openSoundsNotifications() {
//     AssetsAudioPlayer.newPlayer().open(
//       Audio("assets/sounds/alarmp3.mp3"),
//       showNotification: false,
//     );
//   }
// }

//Tercer intento
// import 'dart:async';
// import 'dart:isolate';
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';

// class IsolateArguments {
//   final Duration durationTimer;
//   final SendPort sendPort;

//   IsolateArguments(this.durationTimer, this.sendPort);
// }

// class TimerModel extends ChangeNotifier {
//   late Timer _timer;
//   late Duration _duration;
//   bool _isRunning = false;
//   bool _isPauseTimer = false;

//   TimerModel(int minutes) {
//     _duration = Duration(minutes: minutes);
//   }

//   Isolate? isolate;

//   final ReceivePort receivePortSecundario = ReceivePort();
//   late StreamSubscription streamSubscription;

//   Duration get duration => _duration;
//   bool get isRunning => _isRunning;
//   bool get isPauseTimer => _isPauseTimer;

//   set isPauseTimer(bool value) {
//     // Agregar el setter para isPauseTimer
//     _isPauseTimer = value;
//     notifyListeners();
//   }

//   int get remainingMinutes => _duration.inMinutes;
//   int get remainingSeconds => _duration.inSeconds % 60;

//   void startTimerIsolate() async {
//     // print(
//     //     "Temp directory in main isolate : ${(await getTemporaryDirectory()).path}");
//     try {
//       isolate?.kill();
//       isolate = await Isolate.spawn<IsolateArguments>(
//           start, IsolateArguments(duration, receivePortSecundario.sendPort));
//     } on IsolateSpawnException catch (error) {
//       print("Isolate Failed: $error");
//       receivePortSecundario.close();
//     }
//   }

//   void receivePortMessage() {
//     streamSubscription = receivePortSecundario.listen((message) {
//       print(
//           "Esta es la duracion del tiempo ${_duration.inSeconds} and este es el mensaje recibido $message");
//       _duration = Duration(seconds: message);
//     });
//   }

//   void killIsolate() {
//     isolate!.kill(priority: Isolate.immediate);
//   }

//   void start(IsolateArguments arguments) {
//     if (!_isRunning) {
//       _isRunning = true;
//       isPauseTimer = false;
//       var durationRecieve = arguments.durationTimer;
//       _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//         if (arguments.durationTimer.inSeconds > 0) {
//           durationRecieve -= Duration(seconds: 1);
//           arguments.sendPort.send(durationRecieve);
//           notifyListeners();
//         } else {
//           stop();
//         }
//       });

//       notifyListeners();
//     }
//   }

//   void pauseTime() {
//     if (_isRunning && isolate != null) {
//       _timer.cancel();
//       _isRunning = false;
//       _isPauseTimer = true;
//       isolate!.pause();
//       notifyListeners();
//     }
//   }

//   void resumeTime() {
//     if (!_isRunning && _isPauseTimer) {
//       _isRunning = true;
//       _isPauseTimer = false;
//       _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//         if (_duration.inSeconds > 0) {
//           _duration = _duration - Duration(seconds: 1);
//           notifyListeners();
//         } else {
//           stop();
//         }
//       });
//       notifyListeners();
//     }
//   }

//   void resetTime(BuildContext context) {
//     _timer.cancel();
//     _isRunning = false;
//     _isPauseTimer = false;
//     final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;
//     _duration = Duration(
//         minutes: stateAntigen.testTime ??
//             15); // Cambiar a 15 minutos si es necesario
//     notifyListeners();
//   }

//   void stop() {
//     _timer.cancel();
//     _isRunning = false;
//     _isPauseTimer = false;
//     notifyListeners();
//   }

//   void navigationPageUploadResult(BuildContext context) {
//     openSoundsNotifications();
//     Navigator.pushNamed(context, "uploadResult");
//   }

//   void openSoundsNotifications() {
//     AssetsAudioPlayer.newPlayer().open(
//       Audio("assets/sounds/alarmp3.mp3"),
//       showNotification: false,
//     );
//   }
// }
