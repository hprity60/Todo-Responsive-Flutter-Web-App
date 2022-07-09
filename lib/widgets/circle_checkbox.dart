import 'package:flutter/material.dart';

class CircleCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color checkColor;
  final bool tristate;
  final MaterialTapTargetSize materialTapTargetSize;
  const CircleCheckBox(
      {Key key,
      @required this.value,
      @required this.onChanged,
      this.activeColor,
      this.checkColor,
      this.tristate = false,
      this.materialTapTargetSize})
      : assert(tristate != null),
        assert(tristate || value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
          //color: Theme.of(context).primaryColor,
        ),
        child: Theme(
          data: ThemeData(
            unselectedWidgetColor: Colors.transparent,
          ),
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            tristate: tristate,
            materialTapTargetSize: materialTapTargetSize,
            activeColor: Colors.transparent,
            checkColor: Colors.transparent,
          ),
        ));
  }
}
