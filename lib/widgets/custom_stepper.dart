import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    @required this.icon,
    @required this.onPress,
    @required this.iconSize,
    Key key,
  }) : super(key: key);

  final IconData icon;
  final Function onPress;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      elevation: 6.0,
      onPressed: onPress,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(iconSize * 0.2)),
      fillColor: Theme.of(context).colorScheme.secondary,
      child: Icon(
        icon,
        color: Theme.of(context).canvasColor,
        size: iconSize * 0.8,
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomStepper extends StatefulWidget {
  CustomStepper({
    @required this.value,
    @required this.upperLimit,
    @required this.onValueChanged,
    this.lowerLimit = 1,
    this.stepValue = 1,
    this.iconSize = 8,
    Key key,
  }) : super(key: key);

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  int value;
  final Function(bool isIncrement) onValueChanged;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedIconButton(
          icon: Icons.remove,
          iconSize: widget.iconSize,
          onPress: () {
            if (widget.value != widget.lowerLimit) {
              setState(() {
                widget.value = widget.value - widget.stepValue;
              });
              widget.onValueChanged(true);
            }
          },
        ),
        SizedBox(
          width: widget.iconSize,
          child: Text(
            '${widget.value}',
            style: TextStyle(
              fontSize: widget.iconSize * 0.8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        RoundedIconButton(
          icon: Icons.add,
          iconSize: widget.iconSize,
          onPress: () {
            setState(() {
              widget.value = widget.value + widget.stepValue;
            });
            widget.onValueChanged(true);
          },
        ),
      ],
    );
  }
}
