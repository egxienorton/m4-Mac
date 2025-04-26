import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

class BackgroundPainterUtils {
  static CustomPainter radialGradientCircles(
      {Color centerColor = Colors.deepPurple,
      Color edgeColor = Colors.blue,
      double radiusFactor = 0.7,
      int circleCount = 10}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = RadialGradient(
          colors: [centerColor, edgeColor],
          center: Alignment(0.5, 0.5),
          radius: size.width * radiusFactor,
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = shader;
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

        final random = Random();
        for (int i = 0; i < circleCount; i++) {
          final x = random.nextDouble() * size.width;
          final y = random.nextDouble() * size.height;
          final radius = random.nextDouble() * 20 + 10;

          paint.color = Colors.blue.withOpacity(0.5);
          canvas.drawCircle(Offset(x, y), radius, paint);
        }
      },
    );
  }

  static CustomPainter linearGradientWavyLines(
      {Color startColor = Colors.deepPurple,
      Color endColor = Colors.blue,
      Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = LinearGradient(
          begin: begin,
          end: end,
          colors: [startColor, endColor],
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = shader;
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

        paint.color = Colors.deepPurple.withOpacity(0.7);
        paint.strokeWidth = 3.0;
        final path = Path();
        final random = Random();
        for (int i = 0; i < 4; i++) {
          final xStart = random.nextDouble() * size.width;
          final yStart = random.nextDouble() * size.height;
          final xEnd = random.nextDouble() * size.width;
          final yEnd = random.nextDouble() * size.height;
          path.moveTo(xStart, yStart);
          path.quadraticBezierTo((xStart + xEnd) / 2,
              random.nextDouble() * size.height, xEnd, yEnd);
        }
        canvas.drawPath(path, paint);
      },
    );
  }

  static CustomPainter concentricCirclesGradient(
      {Color startColor = Colors.blue,
      Color endColor = Colors.deepPurple,
      double circleSizeFactor = 0.8}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = RadialGradient(
          colors: [startColor, endColor],
          center: Alignment(0.5, 0.5),
          radius: size.width * circleSizeFactor,
        );

        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = gradient.createShader(Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ));

        final random = Random();
        for (int i = 0; i < 5; i++) {
          final radius = size.width * (i + 1) * 0.1;
          paint.color = paint.color.withOpacity(1 - (i / 5));
          canvas.drawCircle(
              Offset(size.width / 2, size.height / 2), radius, paint);
        }
      },
    );
  }

  static CustomPainter geometricShapesLinearGradient(
      {Color startColor = Colors.green,
      Color endColor = Colors.green,
      Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = LinearGradient(
          begin: begin,
          end: end,
          colors: [startColor, endColor],
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = shader;

        final random = Random();
        for (int i = 0; i < 10; i++) {
          final x = random.nextDouble() * size.width;
          final y = random.nextDouble() * size.height;
          final width = random.nextDouble() * 50 + 20;
          final height = random.nextDouble() * 50 + 20;

          switch (random.nextInt(3)) {
            case 0:
              canvas.drawRect(Rect.fromLTWH(x, y, width, height), paint);
              break;
            case 1:
              canvas.drawCircle(Offset(x + width / 2, y + height / 2),
                  min(width, height) / 2, paint);
              break;
            case 2:
              final path = Path();
              path.moveTo(x, y + height);
              path.lineTo(x + width / 2, y);
              path.lineTo(x + width, y + height);
              path.close();
              canvas.drawPath(path, paint);
              break;
          }
        }
      },
    );
  }

  static CustomPainter swirlingLinesRadialGradient(
      {Color startColor = Colors.pink,
      Color endColor = Colors.pink,
      double radiusFactor = 0.7}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = RadialGradient(
          colors: [startColor, endColor],
          center: Alignment(0.5, 0.5),
          radius: size.width * radiusFactor,
        );

        final paint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.0
          ..shader = gradient.createShader(Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ));

        final random = Random();
        for (int i = 0; i < 10; i++) {
          final xStart = random.nextDouble() * size.width;
          final yStart = random.nextDouble() * size.height;
          final xEnd = random.nextDouble() * size.width;
          final yEnd = random.nextDouble() * size.height;
          final controlX = (xStart + xEnd) / 2;
          final controlY = random.nextDouble() * size.height;
          final path = Path();
          path.moveTo(xStart, yStart);
          path.quadraticBezierTo(controlX, controlY, xEnd, yEnd);
          canvas.drawPath(path, paint);
        }
      },
    );
  }

  static CustomPainter dottedLinesLinearGradient(
      {Color startColor = Colors.orange,
      Color endColor = Colors.orange,
      Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = LinearGradient(
          begin: begin,
          end: end,
          colors: [startColor, endColor],
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.0
          ..shader = shader;

        final random = Random();
        for (int i = 0; i < 5; i++) {
          final xStart = random.nextDouble() * size.width;
          final yStart = random.nextDouble() * size.height;
          final xEnd = random.nextDouble() * size.width;
          final yEnd = random.nextDouble() * size.height;
          final path = Path();
          path.moveTo(xStart, yStart);
          path.lineTo(xEnd, yEnd);

          final dashPath = Path();
          final dashWidth = 10.0;
          final dashSpace = 10.0;
          final dashOffset = 0.0;

          PathMetrics pathMetrics = path.computeMetrics();
          for (PathMetric pathMetric in pathMetrics) {
            double distance = 0.0;
            while (distance < pathMetric.length) {
              dashPath.addArc(
                  Offset(xStart, yStart) & Size(dashWidth, dashWidth), 0, 360);
              distance += dashWidth + dashSpace;
              if (distance < pathMetric.length) {
                distance += dashOffset;
                pathMetric.getTangentForOffset(distance)!.position;
                dashPath.moveTo(
                    pathMetric.getTangentForOffset(distance)!.position.dx,
                    pathMetric.getTangentForOffset(distance)!.position.dy);
              }
            }
          }

          canvas.drawPath(dashPath, paint);
        }
      },
    );
  }

  static CustomPainter polygonsRadialGradient(
      {Color startColor = Colors.teal,
      Color endColor = Colors.teal,
      double radiusFactor = 0.7,
      int polygonSides = 5}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = RadialGradient(
          colors: [startColor, endColor],
          center: Alignment(0.5, 0.5),
          radius: size.width * radiusFactor,
        );

        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = gradient.createShader(Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ));

        final random = Random();
        for (int i = 0; i < 5; i++) {
          final xCenter = random.nextDouble() * size.width;
          final yCenter = random.nextDouble() * size.height;
          final radius = random.nextDouble() * 50 + 20;

          final polygonPoints = <Offset>[];
          final angleIncrement = 2 * pi / polygonSides;
          for (int j = 0; j < polygonSides; j++) {
            final angle = j * angleIncrement;
            final x = xCenter + radius * cos(angle);
            final y = yCenter + radius * sin(angle);
            polygonPoints.add(Offset(x, y));
          }

          final path = Path();
          path.moveTo(polygonPoints.first.dx, polygonPoints.first.dy);
          for (int j = 1; j < polygonPoints.length; j++) {
            path.lineTo(polygonPoints[j].dx, polygonPoints[j].dy);
          }
          path.close();
          canvas.drawPath(path, paint);
        }
      },
    );
  }

  static CustomPainter gridPatternLinearGradient(
      {Color startColor = Colors.yellow,
      Color endColor = Colors.yellow,
      Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = LinearGradient(
          begin: begin,
          end: end,
          colors: [startColor, endColor],
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = shader;

        final gridSpacing = 30.0;
        final paintGrid = Paint()
          ..color = Colors.white.withOpacity(0.5)
          ..strokeWidth = 1.0;
        for (int i = 0; i < size.width / gridSpacing; i++) {
          canvas.drawLine(Offset(i * gridSpacing, 0),
              Offset(i * gridSpacing, size.height), paintGrid);
        }
        for (int i = 0; i < size.height / gridSpacing; i++) {
          canvas.drawLine(Offset(0, i * gridSpacing),
              Offset(size.width, i * gridSpacing), paintGrid);
        }
      },
    );
  }

  static CustomPainter intersectingLinesRadialGradient(
      {Color startColor = Colors.cyan,
      Color endColor = Colors.cyan,
      double radiusFactor = 0.7,
      double lineWidth = 3.0}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = RadialGradient(
          colors: [startColor, endColor],
          center: Alignment(0.5, 0.5),
          radius: size.width * radiusFactor,
        );

        final paint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth
          ..shader = gradient.createShader(Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ));

        final random = Random();
        for (int i = 0; i < 10; i++) {
          final xStart = random.nextDouble() * size.width;
          final yStart = random.nextDouble() * size.height;
          final xEnd = random.nextDouble() * size.width;
          final yEnd = random.nextDouble() * size.height;

          canvas.drawLine(Offset(xStart, yStart), Offset(xEnd, yEnd), paint);
          canvas.drawLine(Offset(xStart, yEnd), Offset(xEnd, yStart), paint);
        }
      },
    );
  }

  static CustomPainter scatteredStarsLinearGradient(
      {Color startColor = Colors.amber,
      Color endColor = Colors.amber,
      Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = LinearGradient(
          begin: begin,
          end: end,
          colors: [startColor, endColor],
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = shader;

        final random = Random();
        for (int i = 0; i < 20; i++) {
          final xCenter = random.nextDouble() * size.width;
          final yCenter = random.nextDouble() * size.height;
          final outerRadius = random.nextDouble() * 10 + 5;
          final innerRadius = outerRadius * 0.6;

          final path = Path();
          final angleIncrement = 2 * pi / 5;
          for (int j = 0; j < 5; j++) {
            final angle = j * angleIncrement;
            final x = xCenter + outerRadius * cos(angle);
            final y = yCenter + outerRadius * sin(angle);
            path.lineTo(x, y);
            path.lineTo(xCenter + innerRadius * cos(angle + angleIncrement / 2),
                yCenter + innerRadius * sin(angle + angleIncrement / 2));
          }
          path.close();
          canvas.drawPath(path, paint);
        }
      },
    );
  }

  static CustomPainter gradientStripesLinearGradient(
      {Color startColor = Colors.indigo,
      Color endColor = Colors.indigo,
      Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight,
      double stripeWidth = 20.0}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = LinearGradient(
          begin: begin,
          end: end,
          colors: [startColor, endColor],
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = shader;

        final random = Random();
        for (int i = 0; i < size.width / stripeWidth; i++) {
          final x = i * stripeWidth;
          final y = random.nextDouble() * size.height;
          final stripeHeight = random.nextDouble() * size.height + 10;
          canvas.drawRect(
              Rect.fromLTWH(x, y, stripeWidth, stripeHeight), paint);
        }
      },
    );
  }

  static CustomPainter texturedBackgroundRadialGradient(
      {Color startColor = Colors.brown,
      Color endColor = Colors.brown,
      double radiusFactor = 0.7,
      double dotSize = 5.0}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = RadialGradient(
          colors: [startColor, endColor],
          center: Alignment(0.5, 0.5),
          radius: size.width * radiusFactor,
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = shader;

        final random = Random();
        for (int i = 0; i < 100; i++) {
          final x = random.nextDouble() * size.width;
          final y = random.nextDouble() * size.height;
          final dotRadius = random.nextDouble() * dotSize + 1;

          paint.color =
              paint.color.withOpacity(random.nextDouble() * 0.5 + 0.2);
          canvas.drawCircle(Offset(x, y), dotRadius, paint);
        }
      },
    );
  }

  static CustomPainter bubblesLinearGradient(
      {Color startColor = Colors.cyan,
      Color endColor = Colors.cyan,
      Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = LinearGradient(
          begin: begin,
          end: end,
          colors: [startColor, endColor],
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = shader;

        final random = Random();
        for (int i = 0; i < 15; i++) {
          final xCenter = random.nextDouble() * size.width;
          final yCenter = random.nextDouble() * size.height;
          final radius = random.nextDouble() * 30 + 10;

          final path = Path();
          path.addOval(Rect.fromCircle(
              center: Offset(xCenter, yCenter), radius: radius));
          canvas.drawPath(path, paint);
        }
      },
    );
  }

  static CustomPainter abstractShapesRadialGradient(
      {Color startColor = Colors.purple,
      Color endColor = Colors.purple,
      double radiusFactor = 0.7}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = RadialGradient(
          colors: [startColor, endColor],
          center: Alignment(0.5, 0.5),
          radius: size.width * radiusFactor,
        );

        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = gradient.createShader(Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ));

        final random = Random();
        for (int i = 0; i < 10; i++) {
          final path = Path();
          final xStart = random.nextDouble() * size.width;
          final yStart = random.nextDouble() * size.height;
          final xControl1 = random.nextDouble() * size.width;
          final yControl1 = random.nextDouble() * size.height;
          final xControl2 = random.nextDouble() * size.width;
          final yControl2 = random.nextDouble() * size.height;
          final xEnd = random.nextDouble() * size.width;
          final yEnd = random.nextDouble() * size.height;

          path.moveTo(xStart, yStart);
          path.cubicTo(xControl1, yControl1, xControl2, yControl2, xEnd, yEnd);
          canvas.drawPath(path, paint);
        }
      },
    );
  }

  static CustomPainter confettiPatternLinearGradient(
      {Color startColor = Colors.pink,
      Color endColor = Colors.pink,
      Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = LinearGradient(
          begin: begin,
          end: end,
          colors: [startColor, endColor],
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = shader;

        final random = Random();
        for (int i = 0; i < 50; i++) {
          final xCenter = random.nextDouble() * size.width;
          final yCenter = random.nextDouble() * size.height;
          final radius = random.nextDouble() * 15 + 5;
          final angleIncrement = 2 * pi / 5;

          switch (random.nextInt(3)) {
            case 0:
              canvas.drawCircle(Offset(xCenter, yCenter), radius, paint);
              break;
            case 1:
              canvas.drawRect(
                  Rect.fromCenter(
                      center: Offset(xCenter, yCenter),
                      width: radius * 2,
                      height: radius * 2),
                  paint);
              break;
            case 2:
              final path = Path();
              for (int j = 0; j < 3; j++) {
                final angle = j * angleIncrement;
                final x = xCenter + radius * cos(angle);
                final y = yCenter + radius * sin(angle);
                if (j == 0) {
                  path.moveTo(x, y);
                } else {
                  path.lineTo(x, y);
                }
              }
              path.close();
              canvas.drawPath(path, paint);
              break;
          }
        }
      },
    );
  }

  List<CustomPainter> backgrounds = [checkerboardPatternLinearGradient()];

  static CustomPainter checkerboardPatternLinearGradient(
      {Color startColor = Colors.grey,
      Color endColor = Colors.grey,
      Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = LinearGradient(
          begin: begin,
          end: end,
          colors: [startColor, endColor],
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = shader;

        final gridSpacing = 30.0;
        for (int i = 0; i < size.width / gridSpacing; i++) {
          for (int j = 0; j < size.height / gridSpacing; j++) {
            if ((i + j) % 2 == 0) {
              canvas.drawRect(
                  Rect.fromLTWH(i * gridSpacing, j * gridSpacing, gridSpacing,
                      gridSpacing),
                  paint);
            }
          }
        }
      },
    );
  }

  static CustomPainter pixelatedBackgroundRadialGradient(
      {Color startColor = Colors.red,
      Color endColor = Colors.red,
      double radiusFactor = 0.7,
      double pixelSize = 10.0}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = RadialGradient(
          colors: [startColor, endColor],
          center: Alignment(0.5, 0.5),
          radius: size.width * radiusFactor,
        );

        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = gradient.createShader(Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ));

        for (int i = 0; i < size.width / pixelSize; i++) {
          for (int j = 0; j < size.height / pixelSize; j++) {
            final x = i * pixelSize;
            final y = j * pixelSize;
            canvas.drawRect(Rect.fromLTWH(x, y, pixelSize, pixelSize), paint);
          }
        }
      },
    );
  }

  static CustomPainter diagonalStripesLinearGradient(
      {Color startColor = Colors.purple,
      Color endColor = Colors.purple,
      Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = LinearGradient(
          begin: begin,
          end: end,
          colors: [startColor, endColor],
        );

        final shader = gradient.createShader(Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ));
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = shader;

        final stripeWidth = 20.0;
        final random = Random();
        for (int i = 0; i < size.width / stripeWidth; i++) {
          final x = i * stripeWidth;
          final y = random.nextDouble() * size.height;
          final stripeLength = random.nextDouble() * size.height + 10;

          final path = Path();
          path.moveTo(x, y);
          path.lineTo(x + stripeLength, y + stripeLength);
          canvas.drawPath(path, paint);
        }
      },
    );
  }

  static CustomPainter halftonePatternRadialGradient(
      {Color startColor = Colors.blue,
      Color endColor = Colors.blue,
      double radiusFactor = 0.7,
      double dotSize = 5.0}) {
    return _BackgroundPainter(
      (canvas, size) {
        final gradient = RadialGradient(
          colors: [startColor, endColor],
          center: Alignment(0.5, 0.5),
          radius: size.width * radiusFactor,
        );

        final paint = Paint()
          ..style = PaintingStyle.fill
          ..shader = gradient.createShader(Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ));

        final random = Random();
        for (int i = 0; i < 200; i++) {
          final x = random.nextDouble() * size.width;
          final y = random.nextDouble() * size.height;
          final dotRadius = random.nextDouble() * dotSize + 1;

          paint.color =
              paint.color.withOpacity(random.nextDouble() * 0.7 + 0.2);
          canvas.drawCircle(Offset(x, y), dotRadius, paint);
        }
      },
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  final Function(Canvas, Size) _paintFunction;

  _BackgroundPainter(this._paintFunction);

  @override
  void paint(Canvas canvas, Size size) {
    _paintFunction(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
