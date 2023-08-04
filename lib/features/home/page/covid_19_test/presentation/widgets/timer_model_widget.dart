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

  void start(BuildContext context) {
    if (_timer == null || !_isRunning) {
      _timer =
          Timer.periodic(const Duration(seconds: 1), (_) => _decreaseTime(context));
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

  void resume(BuildContext context) {
    if (_isPaused) {
      final pausedDuration = DateTime.now().difference(_pauseTime!);
      _isPaused = false;
      _isRunning = true;
      _duration += pausedDuration;
      _timer =
          Timer.periodic(const Duration(seconds: 1), (_) => _decreaseTime(context));
      notifyListeners();
    }
  }

  void stop(BuildContext context) {
    _timer?.cancel();
    _isPaused = false;
    _isRunning = false;
    _pauseTime = null;
    _duration = Duration();
    notifyListeners();
    openSoundsNotifications();
    Navigator.pushNamed(context, "uploadResult");
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

  void _decreaseTime(BuildContext context) {
    if (_duration.inSeconds > 0) {
      _duration = Duration(seconds: _duration.inSeconds - 1);
      notifyListeners();
    } else {
      stop(context);
    }
  }

  void openSoundsNotifications() {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/sounds/alarmp3.mp3"),
      showNotification: false,
    );
  }
}
