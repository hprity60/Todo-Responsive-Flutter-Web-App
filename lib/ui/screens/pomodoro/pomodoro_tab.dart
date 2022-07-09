import 'package:flutter/material.dart';
import '../../../widgets/clock_circle.dart';
import '../../../widgets/select_timer_type.dart';
import '../../../widgets/timer_button.dart';

class PomodoroTab extends StatefulWidget {
  const PomodoroTab({Key key}) : super(key: key);
  @override
  _PomodoroTabState createState() => _PomodoroTabState();
}

class _PomodoroTabState extends State<PomodoroTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SafeArea(
          child: Column(children: [
        SelectTimerType(),
        ClockCircle(),
        TimerButton(),
      ])),
    ));
  }
}
