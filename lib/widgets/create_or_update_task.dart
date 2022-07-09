import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_responsive/models/task.dart';
import 'package:todo_responsive/widgets/custom_button.dart';
import 'package:todo_responsive/widgets/custom_text.dart';
import 'package:todo_responsive/widgets/date_time_picker.dart';
import 'package:todo_responsive/widgets/text_field_card.dart';

import 'category_dropdown.dart';

void createOrUpdateTask(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  showMaterialModalBottomSheet(
      context: context,
      builder: (bc) {
        final _height = MediaQuery.of(context).size.height;
        return CreateTaskFields(_height, _formKey);
      });
}

Task newTask;

StatefulBuilder CreateTaskFields(_height, _formKey) {
  ///I used [StatefulBuilder]because in normal setstate
  ///the modal sheet doesn't update its state. So insted use [modalSetState((){})]
  return StatefulBuilder(builder: (_, modalSetstate) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SizedBox(
        height: _height * 0.8,
        width: 400,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                color: Color(0xFFCFDADF),
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            CustomText(
              text: 'Create New Task',
              textType: TextType.main,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomButton(onPressed: () {}, label: 'Done'),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldCard(
                    child: TextFormField(
                      onChanged: (value) {},
                      validator: (value) {},
                      decoration: InputDecoration(
                        hintText: "Task Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextFieldCard(
                    child: TextFormField(
                      onChanged: (value) {},
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Task Note",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            CustomText(
              text: "Priority",
              textType: TextType.title,
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    onPressed: () {},
                    label: 'Low',
                    color: Color(0xFF66C749),
                  ),
                  CustomButton(
                    onPressed: () {},
                    label: 'Medium',
                    color: Color(0xFFE3A224),
                  ),
                  CustomButton(
                    onPressed: () {},
                    label: 'High',
                    color: Color(0xFFD8334F),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomText(
              text: 'Date & Time',
              textType: TextType.title,
            ),
            DateTimePicker(),
            SizedBox(height: 20),
            CustomText(
              text: 'Category',
              textType: TextType.title,
            ),
            SizedBox(height: 20),
            CategoryDropdown(),
          ],
        ),
      ),
    );
  });
}
