import 'package:flutter/material.dart';

final Color kAppColor = Color(0xfffffb801);
final Color kAppColor2 = Color(0xfffffb801).withGreen(4);

const Color softBlueGreyBackGround = Color(0xffF2F2F2);

const Color kDeepGreyFont = Color(0xff606060);

class AssetConstants {
  AssetConstants._();

  // Base URLs
  static const String baseImageUrl = 'assets/images';
  static const String baseAnimationUrl = 'assets/animations';

  // Image Assets URL
  static const String aiStarLogo = '$baseImageUrl/ai_star_logo.png';
  static const String pdfLogo = '$baseImageUrl/pdf_logo.png';
  static const String textLogo = '$baseImageUrl/text_logo.png';
  static const String imageLogo = '$baseImageUrl/image_logo.png';

  // Animation assets URL
  static const String onboardingAnimation =
      '$baseAnimationUrl/onboarding_animation.json';
}
