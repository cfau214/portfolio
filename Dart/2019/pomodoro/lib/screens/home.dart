import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro/pomo_timer/timer_provider.dart';

class PomodoroHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro Timer'),
      ),
      body: ChangeNotifierProvider<TimerProvider>(
        builder: (_) => TimerProvider(),
        child: PomodoroBody(),
      ),
    );
  }
}

class PomodoroBody extends StatefulWidget {
  @override
  _PomodoroBodyState createState() => _PomodoroBodyState();
}

class _PomodoroBodyState extends State<PomodoroBody> {
  TimerProvider provider;
  String time;

  var _textStyle = TextStyle(fontSize: 26);

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<TimerProvider>(context);
    assert(provider != null);

    time = provider.getTime();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text(time, style: TextStyle(fontSize: 90)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 50,
                width: 150,
                child: RaisedButton(
                  elevation: 8,
                  child: Text('Start', style: _textStyle),
                  onPressed: () {
                    provider.start();
                  },
                ),
              ),
              Container(
                height: 50,
                width: 150,
                child: RaisedButton(
                  elevation: 8,
                  child: Text('Stop', style: _textStyle),
                  onPressed: () {
                    provider.stop();
                  },
                ),
              ),
            ],
          ),
          RaisedButton(
            elevation: 8,
            child: Text('Reset', style: _textStyle),
            onPressed: () {
              provider.reset();
            },
          )
        ],
      ),
    );
  }
}
