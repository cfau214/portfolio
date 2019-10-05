import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class TimerProvider with ChangeNotifier {
  Stopwatch _watch;
  Timer _timer;

  int maxMinutes = 1;
  int minutes = 1;
  int seconds = 1;

  bool get isActive => _watch.isRunning;
  bool get isOnBreak => true;

  Duration get currentDuration => _currentDuration;
  Duration _currentDuration = Duration.zero;

  TimerProvider() {
    _watch = Stopwatch(); // Initialize stopwatch.
    // minutes = 25;
    // seconds = 0;
  }

  _onTick() {
    _currentDuration = _watch.elapsed;
    minutes = maxMinutes - _watch.elapsed.inMinutes - 1;
    seconds = (maxMinutes * 60 - _watch.elapsed.inSeconds) % 60;
    // if (seconds == 0) {
    //   if (minutes == 0) {
    //     stop();
    //     // updateBreak();
    //     if (Vibration.hasVibrator() != null) {
    //       if (Vibration.hasAmplitudeControl() != null) {
    //         Vibration.vibrate(duration: 5000, amplitude: 1024);
    //       } else {
    //         Vibration.vibrate(duration: 5000);
    //       }
    //     }
    //   } else {
    //     minutes--;
    //     seconds = 59;
    //   }
    // }
    if (seconds == 0 && minutes == 0) {
      stop();
      if (Vibration.hasVibrator() != null) {
        if (Vibration.hasAmplitudeControl() != null) {
          Vibration.vibrate(duration: 5000, amplitude: 254);
        } else {
          Vibration.vibrate(duration: 5000);
        }
      }
    } else if (minutes == 25) {
      minutes--;
    }

    notifyListeners();
  }

  start() {
    if (_timer != null) return;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _timer = timer;
      _onTick();
    });
    _watch.start();

    notifyListeners();
  }

  stop() {
    _timer?.cancel();
    _timer = null;
    _watch.stop();
    _currentDuration = _watch.elapsed;

    notifyListeners();
  }

  reset() {
    stop();
    _watch.reset();
    _currentDuration = Duration.zero;
    minutes = 25;
    seconds = 00;

    notifyListeners();
  }

  getTime() {
    return "$minutes:${seconds < 10 ? "0$seconds" : seconds}";
  }
}
