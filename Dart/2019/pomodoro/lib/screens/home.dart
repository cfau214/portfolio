import 'package:flutter/material.dart';
import 'package:pomodoro/pomo_timer/pomo_timer.dart';

class PomodoroHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro Timer'),
      ),
      body: PomodoroBody(),
    );
  }
}

class PomodoroBody extends StatefulWidget {
  @override
  _PomodoroBodyState createState() => _PomodoroBodyState();
}

class _PomodoroBodyState extends State<PomodoroBody> {
  bool isRunning = true;
  // bool shouldReset = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PomoTimer(
            isRunning: isRunning,
            // shouldReset: shouldReset,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('Start'),
                onPressed: () {
                  toggleState();
                },
              ),
              RaisedButton(
                child: Text('Stop'),
                onPressed: () {
                  toggleState();
                },
              ),
              // RaisedButton(
              //   child: Text('Reset'),
              //   onPressed: () {
              //     toggleState();
              //     reset();
              //   },
              // )
            ],
          ),
        ],
      ),
    );
  }

  toggleState() {
    setState(() {
      isRunning = !isRunning;
    });
  }

  // reset() {
  //   setState(() {
  //     shouldReset = !shouldReset;
  //   });
  // }
}
