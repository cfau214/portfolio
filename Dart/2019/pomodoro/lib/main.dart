import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'themes.dart' as themes;

main() => runApp(PomodoroApp());

class PomodoroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      home: PomodoroHome(),
      theme: themes.light,
      darkTheme: themes.dark,
      themeMode: ThemeMode.dark,
    );
  }
}
