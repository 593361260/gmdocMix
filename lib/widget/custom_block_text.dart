import 'dart:ui';
import 'dart:ui' as ui show TextStyle;

import 'package:flutter/material.dart';

class CustomBoardState extends CustomPainter {
  var score;

  CustomBoardState({Key key, this.score});

  final _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = Colors.cyan;
    canvas.drawRect(Rect.fromLTRB(0, 0, 100, 100), _paint);
    var paragraph = ParagraphBuilder(
      ParagraphStyle(
        textAlign: TextAlign.right,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    );
    paragraph.pushStyle(ui.TextStyle(color: Colors.white));
    paragraph.addText(score);
    ParagraphConstraints constraints = ParagraphConstraints(width: 100);
    canvas.drawParagraph(paragraph.build()..layout(constraints), Offset.zero);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
//    return oldDelegate.score != score;
    return false;
  }
}
