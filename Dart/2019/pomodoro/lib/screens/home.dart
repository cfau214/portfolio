import 'package:flutter/material.dart';

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

class PomodoroBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PomoTimer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('Start'),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text('Stop'),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PomoTimer extends StatefulWidget {
  @override
  _PomoTimerState createState() => _PomoTimerState();
}

class _PomoTimerState extends State<PomoTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Timer', style: TextStyle(fontSize: 48)),
    );
  }
}
