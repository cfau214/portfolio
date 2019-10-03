import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class TimerProvider with ChangeNotifier {
  bool _isActive;
  int minutes;
  int seconds;
  Timer _timer;

  TimerProvider()
      : minutes = 0,
        seconds = 5,
        _isActive = false;

  // START
  start() {
    if (!_isActive) {
      _startTimer();
    }

    HapticFeedback.lightImpact();
  }

  _startTimer() {
    _isActive = true;

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
                HapticFeedback.vibrate()
              }
            else
              {
                minutes--,
                seconds = 60,
              }
          },
        notifyListeners()
      },
    );
  }

  // STOP
  stop() {
    _isActive = false;
    assert(_timer != null);
    _timer.cancel();
    HapticFeedback.lightImpact();
    notifyListeners();
  }

  // RESET
  reset() {
    minutes = 25;
    seconds = 0;
    stop();
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
