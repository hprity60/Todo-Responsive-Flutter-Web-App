import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:io' show Platform;

import 'custom_text.dart';

class CustomNavBar extends StatelessWidget {
  final Widget selectedWidgetBody;
  final int selectedIndex;
  final List<NavigationBarItem> navBarItems;
  final Function(int index) onTaped;
  const CustomNavBar({
    @required this.selectedWidgetBody,
    @required this.selectedIndex,
    @required this.navBarItems,
    @required this.onTaped,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildNavbarItems() {
      return <Widget>[
        for (var index = 0; index < navBarItems.length; index++)
          TextButton(
            onPressed: () => onTaped(index),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: navBarItems[index],
            ),
          )
      ];
    }

    return SafeArea(
      bottom: kIsWeb ?? Platform.isIOS ? true : false,
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ScreenTypeLayout(
          mobile: Column(
            children: [
              Expanded(
                child: Container(
                  child: selectedWidgetBody,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildNavbarItems(),
              ),
            ],
          ),
          desktop: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.07,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildNavbarItems(),
                ),
              ),
              Expanded(
                child: Container(
                  child: selectedWidgetBody,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool selected;
  const NavigationBarItem({
    @required this.label,
    @required this.iconPath,
    @required this.selected,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.06;
    return Container(
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected
              ? Theme.of(context).colorScheme.secondary.withOpacity(0.2)
              : null,
        ),
        child: Column(
          children: [
            Image.asset(
              iconPath,
              width: size,
              height: size,
              color: selected
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.grey,
            ),
            CustomText(
              text: label,
              textColor: selected
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.grey,
              textType: TextType.smallest,
            ),
          ],
        ));
  }
}
