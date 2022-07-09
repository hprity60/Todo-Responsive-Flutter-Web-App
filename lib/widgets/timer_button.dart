import 'package:flutter/material.dart';
import 'package:todo_responsive/widgets/custom_button.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                width: 200,
                color: Colors.red,
                onPressed: () {},
                label: "Stop",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                width: 200,
                color: Colors.black26,
                onPressed: () {},
                label: "Play",
              ),
            ),
          ],
        )
      ],
    );
  }
}
