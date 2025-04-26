
import 'package:flutter/material.dart';

import '../../config/constants/kustom_backgrounds.dart';

class KustomPainter extends StatelessWidget {
  final Widget child;

  const KustomPainter({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // CustomPaint as the background
          Positioned.fill(
            child: CustomPaint(
              size: Size.infinite,
              painter: BackgroundPainterUtils.polygonsRadialGradient(
                startColor: Color.fromARGB(255, 82, 237, 4),
                endColor: Color.fromARGB(255, 27, 71, 146),
              ),
            ),
          ),
          // Your content (Column, other widgets) on top
          child
        ],
      ),
    );
  }
}
