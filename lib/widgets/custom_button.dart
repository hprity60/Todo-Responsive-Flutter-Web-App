import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_responsive/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Function onPressed;
  final String label;
  final Color color;
  const CustomButton(
      {Key key,
      this.width,
      this.height,
      @required this.onPressed,
      @required this.label,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
              width: width ?? 100,
              height: height ?? 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: color ?? Theme.of(context).colorScheme.secondary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                onPressed: onPressed,
                child: CustomText(text: label),
              )),
        ],
      ),
    );
  }
}
