import 'package:flutter/material.dart';
import 'package:todo_responsive/widgets/custom_text.dart';

class DateTimePicker extends StatelessWidget {
  final DateTime currentDateTime = DateTime(2022, 07, 06);
  DateTimePicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future _selectDate() async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: currentDateTime,
          firstDate: DateTime.now().subtract(Duration(days: 1)),
          lastDate: DateTime(2030));
    }

    Future _selectTime() async {
      final TimeOfDay picked = await showTimePicker(
          context: context, initialTime: TimeOfDay(hour: 04, minute: 40));
    }

    return Flexible(
      child: Container(
        width: 330,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/date_and_time_icon.png",
              color: Theme.of(context).iconTheme.color,
              height: 25,
              width: 25,
            ),
            TextButton(
              onPressed: () async {
                _selectDate();
              },
              child: CustomText(
                text: 'Tue, July 5, 2022',
                textColor: Theme.of(context).colorScheme.secondary,
                textType: TextType.input,
              ),
            ),
            Image.asset(
              "assets/icons/clock_icon.png",
              color: Theme.of(context).iconTheme.color,
              height: 25,
              width: 25,
            ),
            TextButton(
              onPressed: () {
                _selectTime();
              },
              child: CustomText(
                text: '04:40',
                textColor: Theme.of(context).colorScheme.secondary,
                textType: TextType.input,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
