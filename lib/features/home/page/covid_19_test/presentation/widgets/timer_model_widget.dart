// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../../config/helpers/navigator_key.dart';
// import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';

// class TimerModel extends ChangeNotifier {
//   Timer? _timer;
//   late Duration _duration;
//   bool _isPaused = false;
//   DateTime? _pauseTime;

//   TimerModel(int minutes) {
//     _duration = Duration(minutes: minutes);
//   }

//   int get remainingMinutes => _duration.inMinutes;
//   Duration get duration => _duration;
//   bool get isRunning => _timer?.isActive ?? false;
//   bool get isPaused => _isPaused;

//   void start() {
//     if (_timer == null || !_timer!.isActive) {
//       _timer = Timer.periodic(const Duration(seconds: 1), (_) => _decreaseTime());
//     }
//   }

//   void pause() {
//     if (_timer?.isActive == true && !_isPaused) {
//       _isPaused = true;
//       _pauseTime = DateTime.now();
//       _timer?.cancel();
//       notifyListeners();
//     }
//   }

//   void resume() {
//     if (_isPaused) {
//       final pausedDuration = DateTime.now().difference(_pauseTime!);
//       _isPaused = false;
//       _duration += pausedDuration;
//       _timer = Timer.periodic(const Duration(seconds: 1), (_) => _decreaseTime());
//       notifyListeners();
//     }
//   }

//   void stop() {
//     _timer?.cancel();
//     _isPaused = false;
//     _pauseTime = null;
//     _duration = Duration();
//     notifyListeners();
//   }

//   void resetTime(BuildContext context) {
//     final stateAntigen = BlocProvider.of<AntigenTestBloc>(
//             NavigatorKey.navigatorKey.currentState?.context ?? context)
//         .state;

//     _pauseTime = null;
//     final testTime = stateAntigen.testTime ?? 15;
//     _duration = Duration(minutes: testTime);
//     notifyListeners();
//   }

//   void _decreaseTime() {
//     if (_duration.inSeconds > 0) {
//       _duration = Duration(seconds: _duration.inSeconds - 1);
//       notifyListeners();
//     } else {
//       stop();
//     }
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/helpers/navigator_key.dart';
import '../../../../../antigen/presentation/bloc/antigen_test_bloc.dart';

class TimerModel extends ChangeNotifier {
  late Timer _timer;
  late Duration _duration;
  bool _isRunning = false;
  bool _isPauseTimer = false;

  TimerModel(int minutes) {
    _duration = Duration(minutes: minutes);
  }

  Duration get duration => _duration;
  bool get isRunning => _isRunning;
  bool get isPauseTimer => _isPauseTimer;
  set isPauseTimer(bool value) {
    // Agregar el setter para isPauseTimer
    _isPauseTimer = value;
    notifyListeners();
  }

  int get remainingMinutes => _duration.inMinutes;
  int get remainingSeconds => _duration.inSeconds % 60;

  void start() {
    if (!_isRunning) {
      _isRunning = true;
      isPauseTimer = false;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_duration.inSeconds > 0) {
          _duration = _duration - Duration(seconds: 1);
          notifyListeners();
        } else {
          stop();
        }
      });
      notifyListeners();
    }
  }

  void pauseTime() {
    if (_isRunning) {
      _timer.cancel();
      _isRunning = false;
      isPauseTimer = true; // Corregir aquí
      notifyListeners();
    }
  }

  void resumeTime() {
    if (!_isRunning && isPauseTimer) {
      // Corregir aquí
      _isRunning = true;
      isPauseTimer = false; // Corregir aquí
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_duration.inSeconds > 0) {
          _duration = _duration - Duration(seconds: 1);
          notifyListeners();
        } else {
          stop();
        }
      });
      notifyListeners();
    }
  }

  void resetTime(BuildContext context) {
    _timer.cancel();
    _isRunning = false;
    _isPauseTimer = false;
    final stateAntigen = BlocProvider.of<AntigenTestBloc>(context).state;
    _duration = Duration(
        minutes: stateAntigen.testTime ??
            15); // Cambiar a 15 minutos si es necesario
    notifyListeners();
  }

  void stop() {
    _timer.cancel();
    _isRunning = false;
    _isPauseTimer = false;
    notifyListeners();
  }
}
