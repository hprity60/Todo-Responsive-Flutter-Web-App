import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  final bool isSelected;
  final int hexColor;
  const ColorCircle({Key key, 
  @required this.isSelected, 
  @required this.hexColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: isSelected
                ? Border.all(width: 3, color: Color(hexColor))
                : null,
            borderRadius: BorderRadius.circular(50)),
        child: Container(
          decoration: BoxDecoration(
              color: Color(hexColor),
              border: isSelected
                  ? Border.all(width: 2, color: Theme.of(context).canvasColor)
                  : null,
              borderRadius: BorderRadius.circular(50)),
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
