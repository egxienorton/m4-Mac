import 'package:flutter/material.dart';
import 'package:xiphone/config/theme/theme_switcher.dart';

class ThemeHomePage extends StatelessWidget {
  const ThemeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher Demo'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Select theme mode:'),
            const SizedBox(height: 20,),
            const ThemeSwitcher()
          ],
        ),
      ),
    );
  }
}