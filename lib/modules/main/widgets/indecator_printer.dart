import 'package:flutter/material.dart';

// Circle indicator
class CircleTabIndicator extends Decoration {
  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  final Color color;
  final double radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

// Circle pointer
class _CirclePainter extends BoxPainter {
  _CirclePainter({
    required this.color,
    required this.radius,
  });

  final Color color;
  final double radius;

  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}