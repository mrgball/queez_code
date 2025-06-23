import 'package:flutter/material.dart';

class BackgroundGraphicView extends StatelessWidget {
  final Widget? child;
  final Color? color;

  const BackgroundGraphicView({
    super.key,
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundGraphic(color: color),
      child: child,
    );
  }
}

class BackgroundGraphic extends CustomPainter {
  final Color? color;

  BackgroundGraphic({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Colors.tealAccent.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final path = Path();

    // Membuat wave dari kanan atas ke kiri tengah bawah
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.5,
      0,
      size.height * 0.7,
    );
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
