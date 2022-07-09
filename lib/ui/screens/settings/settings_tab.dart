import 'package:flutter/material.dart';
import 'package:todo_responsive/widgets/settings_card.dart';
import '../../../widgets/color_circle.dart';
import '../../../widgets/custom_stepper.dart';
import '../../../widgets/custom_text.dart';

class SettingsTap extends StatelessWidget {
  SettingsTap({Key key}) : super(key: key);

  final List<Widget> columns = [
    const PrefrencesColumn(),
    TimerColumn(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Wrap(
              spacing: 40,
              children: columns,
            ),
          ),
        ),
      ),
    );
  }
}

class PrefrencesColumn extends StatefulWidget {
  const PrefrencesColumn({Key key}) : super(key: key);

  @override
  State<PrefrencesColumn> createState() => _PrefrencesColumnState();
}

class _PrefrencesColumnState extends State<PrefrencesColumn> {
  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Theme.of(context).colorScheme.secondary;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomText(
              text: 'Preferences',
              iprefText: true,
              textType: TextType.main,
            ),
          ),
          SettingsCard(
            label: 'Color',
            child: Row(
              children: prefrencesColorsLight
                  .map((hexColor) => ColorCircle(
                        isSelected: selectedColor == Color(hexColor),
                        hexColor: hexColor,
                      ))
                  .toList(),
            ),
          ),
          SettingsCard(
            label: 'Dark Theme',
            child: Switch.adaptive(
                value: true, activeColor: selectedColor, onChanged: (value) {}),
          ),
          SettingsCard(
            label: 'Language',
            child: SizedBox(
              width: 100,
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  value: 'English',
                  iconSize: 0,
                  underline: Container(),
                  icon: Container(),
                  isExpanded: true,
                  items: ['English', 'Bangla'].map((dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: SizedBox(
                          width: 200,
                          child: CustomText(
                            text: dropDownStringItem,
                            iprefText: true,
                          )),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimerColumn extends StatelessWidget {
  const TimerColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomText(
              text: 'Timer',
              iprefText: true,
              textType: TextType.main,
            ),
          ),
          SizedBox(height: 20),
          SettingsCard(
            label: 'Pomodoro',
            child: CustomStepper(value: 50),
            upperLimit: 200,
            onValueChanged: (isIncrement) {},
            iconSize: 60,
          ),
          SettingsCard(
            label: 'Short break',
            child: CustomStepper(value: 50),
            upperLimit: 200,
            onValueChanged: (isIncrement) {},
            iconSize: 60,
          ),
          SettingsCard(
            label: 'Lonk break',
            child: CustomStepper(value: 50),
            upperLimit: 200,
            onValueChanged: (isIncrement) {},
            iconSize: 60,
          ),
        ],
      ),
    );
  }
}

final List<int> prefrencesColorsLight = [
  0xFF3E844F, //green
  0xFFA3007A, //eggplant
  0xFF005D85, //blue
  0xFF000000, //black
];
