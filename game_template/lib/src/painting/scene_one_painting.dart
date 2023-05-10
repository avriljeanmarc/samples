import 'package:flutter/material.dart';

class SceneOnePainting extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red;
    canvas.drawCircle(Offset(50.0, 50.0), 50.0, paint);
  }

  @override
  bool shouldRepaint(covariant SceneOnePainting oldDelegate) {
    return true;
  }
}
