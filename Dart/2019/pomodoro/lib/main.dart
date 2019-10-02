import 'package:flutter/material.dart';
import 'screens/home.dart';

main() => runApp(PomodoroApp());

class PomodoroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      home: PomodoroHome(),
    );
  }
}
