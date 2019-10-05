import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class TimerProvider with ChangeNotifier {
  Stopwatch _watch;
  Timer _timer;

  int maxMinutes = 25;  // Changes based on breakCounter.
  int minutes = 25;
  int seconds = 0;
  int breakCount = 0;

  bool get isActive => _watch.isRunning;
  bool get isOnBreak => breakCount == 1 || breakCount == 3 || breakCount == 5;
  bool get hasReachedZero => minutes == 0 && seconds == 0;

  Duration get currentDuration => _currentDuration;
  Duration _currentDuration = Duration.zero;

  TimerProvider() {
    _watch = Stopwatch(); // Initialize stopwatch.
  }

  start() {
    if (_timer != null) return;

    if (hasReachedZero) {
      minutes = maxMinutes;
      seconds = 0;
      _watch.reset();
      _currentDuration = Duration.zero;
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) => _onTick());
    _watch.start();

    notifyListeners();
  }

  _onTick() {
    _currentDuration = _watch.elapsed;
    minutes = maxMinutes - _watch.elapsed.inMinutes - 1;
    seconds = (maxMinutes * 60 - _watch.elapsed.inSeconds) % 60;

    // if (maxMinutes == 10) minutes -= 10;
    if (seconds == 0) minutes++;  // Since minute decrements when seconds hit 0 instead of 59.
                                  // eg. 23:01 -> 22:00 -> 22:59 
    if (seconds == 0 && minutes == 0) {
      stop();
      updateBreak();
      if (Vibration.hasVibrator() != null) {
        if (Vibration.hasAmplitudeControl() != null) {
          Vibration.vibrate(duration: 5000, amplitude: 254);
        } else {
          Vibration.vibrate(duration: 5000);
        }
      }
    }

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
    seconds = 0;
    breakCount = 0;

    notifyListeners();
  }

  getTime() {
    return "${minutes < 10 ? 0 : ''}$minutes:${seconds < 10 ? "0$seconds" : seconds}";
  }

  updateBreak() {
    breakCount ++;

    switch (breakCount) {
      case 6:
        maxMinutes = 25;
        breakCount = 0;
        break;
      case 5:
        maxMinutes = 10;
        break;
      case 4:
        maxMinutes = 25;
        break;
      case 3:
        maxMinutes = 5;
        break;
      case 2:
        maxMinutes = 25;
        break;
      case 1:
        maxMinutes = 5;
        break;

      default: 
        break;
    }
  }

  getBreakNumberForUI() {
    switch (breakCount) {
      case 1:
        return 1;
        break;
      case 3:
        return 2;
        break;
      case 5:
        return 3;
        break;
      default:
        break;
    }
  }
}
