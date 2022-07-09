import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).colorScheme.secondary;
    final textcolor = Theme.of(context).textTheme.button.color;
    final borderRadius = BorderRadius.circular(5);

    return Container(
      margin: EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(9)),
      child: TableCalendar(
          selectedDayPredicate: (day) {
            return isSameDay(day, selectedDate);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              selectedDate = selectedDay;
            });
          },
          daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: TextStyle(color: textcolor, height: 1, fontSize: 12),
            weekdayStyle: TextStyle(color: textcolor, height: 1, fontSize: 12),
          ),
          calendarStyle: CalendarStyle(
            weekendTextStyle: TextStyle(color: textcolor),
            selectedDecoration: BoxDecoration(color: selectedColor),
            todayDecoration: BoxDecoration(
              color: selectedColor.withOpacity(0.3),
              shape: BoxShape.rectangle,
              borderRadius: borderRadius,
            ),
            isTodayHighlighted: true,
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          focusedDay: DateTime.now(),
          firstDay: DateTime.now().subtract(Duration(days: 1)),
          lastDay: DateTime(2300)),
    );
  }
}
