import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ClockDialPainter extends CustomPainter {
  final hourTickMarkLength = 15.0;
  final minuteTickMarkLength = 10.0;

  final hourTickMarkWidth = 3.0;
  final minuteTickMarkWidth = 1.5;
  final Paint circlePaint;
  final Paint tickPaint;

  ClockDialPainter()
      : tickPaint = Paint(),
        circlePaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10.0 {
    tickPaint.color = Colors.black;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double tickMarkLength;
    const angle = 2 * pi / 60;
    final radius = (size.width / 2);
    final radius2 = (size.height / 2);
    circlePaint.shader = ui.Gradient.linear(
      Offset(0.0, radius2),
      Offset(0.0, -radius2),
      [const Color(0xFF80D8FF), const Color(0xFF86C691)],
    );
    circlePaint.strokeWidth = 15;
    canvas.save();
    // drawing
    canvas.translate(radius, radius2);
    canvas.drawCircle(const Offset(0, 0), radius - 20, circlePaint);

    for (var i = 0; i < 60; i++) {
      //make the length and stroke of the tick marker longer and thicker depending
      tickMarkLength = i % 5 == 0 ? hourTickMarkLength : minuteTickMarkLength;
      tickPaint.strokeWidth =
          i % 5 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;
      tickPaint.shader = i % 5 == 0
          ? ui.Gradient.linear(
              Offset(0.0, radius),
              Offset(0.0, radius + tickMarkLength),
              [Colors.greenAccent, Colors.blueAccent],
            )
          : null;
      canvas.drawLine(
        Offset(0.0, radius),
        Offset(0.0, radius + tickMarkLength),
        tickPaint,
      );

      canvas.rotate(angle);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
