import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import 'dart:async';

class TimerProvider with ChangeNotifier {
  int minutes;
  int maxMinutes;
  int seconds;
  int breakCounter;
  bool _isActive;
  Timer _timer;

  static final int _defaultMins = 25;
  static final int _defaultSeconds = 0;

  TimerProvider()
      : minutes = _defaultMins,
        maxMinutes = _defaultMins,
        seconds = _defaultSeconds,
        breakCounter = 0,
        _isActive = false;

  bool get isActive => _isActive;
  bool get isOnBreak => maxMinutes == 5 || maxMinutes == 10 ? true : false;

  // START
  start() {
    if (!_isActive) {
      _startTimer();
    }

    HapticFeedback.lightImpact();
  }

  _startTimer() {
    _isActive = true;

    if (minutes == 0 && seconds == 0) {
      minutes = maxMinutes;
      seconds = 60;
    }

    new Timer.periodic(
      Duration(seconds: 1),
      (timer) => {
        if (minutes == 25)
          {
            minutes = 24,
            seconds = 60,
          },
        _timer = timer,
        seconds--,
        if (seconds == 0)
          {
            if (minutes == 0)
              {
                stop(),
                updateBreak(),
                if (Vibration.hasVibrator() != null)
                  {
                    if (Vibration.hasAmplitudeControl() != null)
                      {Vibration.vibrate(duration: 5000, amplitude: 1024)}
                    else
                      {Vibration.vibrate(duration: 5000)}
                  }
              }
            else
              {
                minutes--,
                seconds = 59,
              }
          },
        notifyListeners()
      },
    );
  }

  // STOP
  stop() {
    if (_isActive) {
      _isActive = false;
      assert(_timer != null);
      _timer.cancel();
    } else {
      reset();
    }
    HapticFeedback.lightImpact();
    notifyListeners();
  }

  // RESET
  reset() {
    maxMinutes = _defaultMins;
    minutes = maxMinutes;
    seconds = _defaultSeconds;
    breakCounter = -1;
  }

  // Break Counter
  updateBreak() {
    breakCounter++;

    switch (breakCounter) {
      case 6:
        reset();
        break;
      case 5:
        maxMinutes = 10;
        break;
      case 4:
        maxMinutes = _defaultMins;
        break;
      case 3:
        maxMinutes = 5;
        break;
      case 2:
        maxMinutes = _defaultMins;
        break;
      case 1:
        maxMinutes = 5;
        break;

      default:
        reset();
        break;
    }
  }

  String getTime() => getMinutes() + ":" + getSeconds();

  String getMinutes() {
    String ret;

    if (minutes == 0) {
      ret = "00";
    } else if (minutes < 10) {
      ret = "0$minutes";
    } else {
      ret = "$minutes";
    }

    return ret;
  }

  String getSeconds() {
    String ret;

    if (seconds == 0) {
      ret = "00";
    } else if (seconds < 10) {
      ret = "0$seconds";
    } else {
      ret = "$seconds";
    }

    return ret;
  }
}
