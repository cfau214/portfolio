import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import 'dart:async';

class TimerProvider with ChangeNotifier {
  int minutes;
  int seconds;
  bool _isActive;
  Timer _timer;

  TimerProvider()
      : minutes = 25,
        seconds = 0,
        _isActive = false;

  bool get isActive => _isActive;

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
        if (seconds == -1)
          {
            if (minutes == 0)
              {
                stop(),
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
