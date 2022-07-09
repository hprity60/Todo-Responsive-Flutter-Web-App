import 'package:flutter/material.dart';
import 'package:todo_responsive/widgets/custom_text.dart';

class SelectTimerType extends StatelessWidget {
  const SelectTimerType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _typeChip({String label, String type}) {
      return Container(
        margin: EdgeInsets.all(5),
        width: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
              primary: Theme.of(context).textTheme.button.color,
              padding: EdgeInsets.symmetric(vertical: 5),
              backgroundColor: Theme.of(context).primaryColor,
              // textStyle: TextStyle(color: Theme.of(context).accentColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: () {},
          child: CustomText(text: label),
        ),
      );
    }

    return Column(
      children: [
        _typeChip(label: 'Work Time', type: 'Work Time'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _typeChip(label: 'Short Break', type: 'Short Break'),
            _typeChip(label: 'Long Break', type: 'Long Break'),
          ],
        )
      ],
    );
  }
}
