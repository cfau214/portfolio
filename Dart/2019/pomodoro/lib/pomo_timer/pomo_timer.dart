import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class PomoTimer extends StatefulWidget {
  final bool isRunning;
  // final bool shouldReset;

  PomoTimer({
    this.isRunning,
    // this.shouldReset,
  });

  @override
  _PomoTimerState createState() => _PomoTimerState();
}

class _PomoTimerState extends State<PomoTimer> {
  var minutes = 25;
  var seconds = 0;

  @override
  PomoTimer get widget => super.widget;

  @override
  void initState() {
    if (widget.isRunning) {
      Timer(Duration(seconds: 1), () {
        minutes = 0;
        seconds = 9;
      });

      startTimer();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(getTime(), style: TextStyle(fontSize: 90)),
    );
  }

  startTimer() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) => {
        widget.isRunning
            ? setState(() {
                seconds--;
                if (seconds == 0) {
                  if (minutes == 0) {
                    timer.cancel();
                    HapticFeedback.vibrate(); //TODO: Verify Implementation.
                  } else {
                    minutes--;
                    seconds = 60;
                  }
                }
              })
            : timer.cancel()
      },
    );
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
