import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry padding;
  final Color textColor;
  // final double fontSize;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final bool iprefText;
  final FontWeight fontWeight;
  final TextType textType;

  /// This custom text is used to unify the text style of the app
  const CustomText({
    @required this.text,
    this.padding,
    this.textColor,
    this.textAlign,
    this.textDirection,
    this.fontWeight,
    this.iprefText = false, //if the text should use the prefrences color
    this.textType = TextType.body,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(textColor);
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text.tr,
        style: TextStyle(
          color:
              iprefText ? Theme.of(context).colorScheme.secondary : textColor,
          fontSize: responsiveTextsizes(context, textType),
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,
        softWrap: false,
        textDirection: textDirection,
      ),
    );
  }
}

enum TextType {
  smallest,
  paragraph,
  body,
  input,
  title,
  main, //for desktop only
}

double responsiveTextsizes(
  BuildContext context,
  TextType type,
) {
  if (type == TextType.body) {
    return getValueForScreenType<double>(
        context: context, mobile: 16.0, tablet: 16.0, desktop: 18.0);
  } else if (type == TextType.title) {
    return getValueForScreenType<double>(
        context: context, mobile: 20.0, tablet: 20.0, desktop: 24.0);
  } else if (type == TextType.input) {
    return getValueForScreenType<double>(
        context: context, mobile: 16.0, tablet: 16.0, desktop: 18.0);
  } else if (type == TextType.smallest) {
    return 12.0;
  } else if (type == TextType.main) {
    return getValueForScreenType<double>(
        context: context, mobile: 20.0, tablet: 20.0, desktop: 32.0);
  }
  // TextType.paragraph
  return 14.0;
}
