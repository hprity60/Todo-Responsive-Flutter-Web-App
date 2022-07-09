import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'clock_dail_painter.dart';
import 'custom_text.dart';

class ClockCircle extends StatelessWidget {
  const ClockCircle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(left: 40, right: 40),
        child: CircularPercentIndicator(
          percent: 0.0,
          animation: true,
          lineWidth: 20.0,
          circularStrokeCap: CircularStrokeCap.square,
          linearGradient: LinearGradient(
            colors: [
              Colors.green.withOpacity(0.2),
              Colors.blue.withOpacity(0.2)
            ],
            tileMode: TileMode.mirror,
          ),
          reverse: false,
          backgroundColor: Colors.transparent,
          animateFromLastPercent: true,
          widgetIndicator: const Icon(Icons.arrow_drop_down_rounded,
              size: 100, color: Colors.red),
          // for mobile
          radius: 280,
          center: Container(
            margin: EdgeInsets.all(40),
            child: Stack(children: [
              RepaintBoundary(
                child: SizedBox(
                  width: double.infinity,
                  child: CustomPaint(
                    size: const Size.square(200),
                    painter: ClockDialPainter(),
                  ),
                ),
              ),
              Center(
                child: CustomText(
                  text: "27:30",
                  textType: TextType.main,
                  iprefText: true,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
