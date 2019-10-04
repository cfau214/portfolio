import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro/pomo_timer/timer_provider.dart';

class PomodoroHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pomodoro', style: TextStyle(fontSize: 24)),
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
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 20),
          Expanded(
            child: MainColumn(
              time: time,
              provider: provider,
              textStyle: _textStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class MainColumn extends StatelessWidget {
  const MainColumn({
    Key key,
    @required this.time,
    @required this.provider,
    @required TextStyle textStyle,
  })  : _textStyle = textStyle,
        super(key: key);

  final String time;
  final TimerProvider provider;
  final TextStyle _textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Visibility(
          visible: provider.isOnBreak,
          child: Text(
            'Break',
            style: TextStyle(color: Colors.red),
          ),
        ),
        // Timer
        Container(
          child: Text(
            time,
            style: TextStyle(
                fontSize: 90,
                color: provider.minutes < 1
                    ? Colors.red
                    : Theme.of(context).textTheme.title.color),
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Start Button
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: provider.isActive ? 30 : 50,
              width: provider.isActive ? 130 : 150,
              child: RaisedButton(
                color: provider.isActive
                    ? Colors.black
                    : Theme.of(context).buttonTheme.colorScheme,
                disabledColor: Colors.black,
                elevation: 8,
                child: Text('Start', style: _textStyle),
                onPressed: provider.isActive
                    ? null
                    : () {
                        provider.start();
                      },
              ),
            ),
            // Stop Button
            Container(
              height: 50,
              width: 150,
              child: RaisedButton(
                color: provider.isActive
                    ? Colors.red
                    : Theme.of(context).buttonTheme.colorScheme,
                elevation: 8,
                child: Text(
                  provider.isActive ? 'Stop' : 'Reset',
                  style: _textStyle,
                ),
                onPressed: () {
                  provider.stop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
