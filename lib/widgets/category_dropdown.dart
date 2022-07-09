import 'package:flutter/material.dart';
import 'package:todo_responsive/widgets/custom_text.dart';

class CategoryDropdown extends StatefulWidget {
  CategoryDropdown({Key key}) : super(key: key);

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String currentCategory = "Default";

  var items = ["Default", "Personal", "Work"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            spreadRadius: 1.0,
            blurRadius: 6.0,
            color: Colors.black26,
          )
        ],
        color: Theme.of(context).primaryColor,
      ),
      child: DropdownButton(
        icon: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black,
          ),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ),
        isExpanded: true,
        underline: Container(),
        value: currentCategory,
        items: items
            .map((String items) =>
                DropdownMenuItem(value: items, child: CustomText(text: items)))
            .toList(),
        onChanged: (String newValue) {
          setState(() {
            currentCategory = newValue;
          });
        },
      ),
    );
  }
}
