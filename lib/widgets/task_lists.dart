import 'package:flutter/material.dart';
import 'package:todo_responsive/widgets/custom_text.dart';

import 'task_block.dart';

class TaskLists extends StatelessWidget {
  const TaskLists({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        CustomText(
          text: 'Today',
          textType: TextType.title,
        ),
        TaskBlock(),
      ],
    );
  }
}
