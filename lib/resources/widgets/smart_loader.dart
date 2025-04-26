import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SmartLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
      child: SizedBox(
          height: 120,
          width: 120,
          child: Lottie.asset('assets/lottieFiles/xloaderpro.json')));
}
