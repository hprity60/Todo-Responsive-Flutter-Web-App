import 'package:flutter/material.dart';
import 'package:todo_responsive/widgets/custom_text.dart';

import '../../widgets/create_or_update_task.dart';
import '../../widgets/task_lists.dart';
import '../../widgets/text_block.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({Key key}) : super(key: key);
  @override
  _TasksTabState createState() => _TasksTabState();
}

double _height;

class _TasksTabState extends State<TasksTab> {
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          TaskLists(),
          Container(
            margin: EdgeInsets.only(top: _height * 0.4),
            alignment: Alignment.center,
            child: const CustomText(
                textType: TextType.title, text: 'There is no tasks here yet.'),
          ),
        ],
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
