import 'package:flutter/material.dart';
import 'package:todo_responsive/widgets/custom_text.dart';

import '../../../widgets/calendar_widget.dart';
import '../../../widgets/create_or_update_task.dart';
import '../../../widgets/task_lists.dart';

class CalendartTap extends StatefulWidget {
  const CalendartTap({Key key}) : super(key: key);
  @override
  _CalendartTapState createState() => _CalendartTapState();
}

class _CalendartTapState extends State<CalendartTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CalendarWidget(),
            CustomText(
              text: 'There is 0 tasks on this day',
              textType: TextType.title,
            ),
            TaskLists(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          createOrUpdateTask(context);
        },
      ),
    );
  }
}
