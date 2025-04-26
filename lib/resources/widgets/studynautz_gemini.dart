import 'package:flutter/material.dart';

import '../../config/extension/context.dart';
import '../../config/constants/constants.dart';

class StudynautzGemini extends StatelessWidget {
  const StudynautzGemini({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Studynautz',
          style: TextStyle(
            color: context.colorScheme.background,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Image.asset(
          AssetConstants.aiStarLogo,
          scale: 23,
        ),
      ],
    );
  }
}

class GeminiIcon extends StatelessWidget {
  final double? scaleSize;
  const GeminiIcon({this.scaleSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetConstants.aiStarLogo,
      scale: scaleSize == null ? 23 : scaleSize,
    );
  }
}
