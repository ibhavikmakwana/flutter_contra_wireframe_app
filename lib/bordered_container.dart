import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;
  final bool isCircle;
  final double radius;
  final double width;
  final double height;
  final EdgeInsets padding;
  final Color fillColor;

  const BorderedContainer({
    Key key,
    this.child,
    this.isCircle = false,
    this.radius,
    this.padding = const EdgeInsets.all(0.0),
    this.fillColor = Colors.white,
    this.width,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: CustomBorderContainer(
          borderColor: Colors.black,
          fillColor: fillColor,
          isCircle: isCircle,
          circleRadius: radius,
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class CustomBorderContainer extends CustomPainter {
  final Color borderColor;
  final Color fillColor;
  final double strokeWidth;
  final double circleRadius;
  final bool isCircle;

  CustomBorderContainer({
    @required this.borderColor,
    this.fillColor,
    this.strokeWidth = 2,
    this.circleRadius,
    this.isCircle = false,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    Paint filledPaint = new Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth;

    final radius = Radius.circular(16.0);
    final firstRect = RRect.fromLTRBAndCorners(
      0,
      0,
      size.width,
      size.height,
      bottomLeft: radius,
      bottomRight: radius,
      topLeft: radius,
      topRight: radius,
    );
    final secondRect = RRect.fromLTRBAndCorners(
      0,
      0,
      size.width,
      size.height + strokeWidth,
      bottomLeft: radius,
      bottomRight: radius,
      topLeft: radius,
      topRight: radius,
    );

    final firstCircleRect = Rect.fromLTRB(
      0,
      0,
      size.width,
      size.height + strokeWidth,
    );
    final secondCircleRect = Rect.fromLTRB(
      0,
      0,
      size.width,
      size.height + strokeWidth + strokeWidth,
    );
    if (isCircle) {
      canvas.drawOval(secondCircleRect, filledPaint);
      canvas.drawOval(firstCircleRect, paint..color);
      canvas.drawOval(secondCircleRect, paint);
    } else {
      canvas.drawRRect(secondRect, filledPaint);
      canvas.drawRRect(firstRect, paint);
      canvas.drawRRect(secondRect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
