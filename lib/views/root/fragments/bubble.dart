import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';

class ContractListStatusBubble extends CustomPainter {
  ContractListStatusBubble({this.color});

  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    drawBubble(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Color get bubbleColor => color ?? EasyCartColorMap().stateOverlay.pressed;

  drawBubble(Canvas canvas, Size size) {
    drawBubbleRect(canvas, size);
  }

  drawBubbleRect(Canvas canvas, Size size) {
    final x = size.width;
    final y = size.height;

    final Paint fill = Paint()
      ..color = bubbleColor
      ..style = PaintingStyle.fill;

    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(x / 2, y / 2),
        width: x,
        height: y,
      ),
      const Radius.circular(4),
    );

    Path path = Path()
      ..moveTo(8, 0)
      ..lineTo(12, -6)
      ..arcToPoint(const Offset(15, -6), radius: const Radius.circular(2))
      ..lineTo(20, -0)
      ..moveTo(8, 0);

    canvas.drawRRect(fullRect, fill);
    canvas.drawPath(path, fill);
  }
}
