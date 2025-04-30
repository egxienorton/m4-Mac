import 'package:flutter/material.dart';

class SettingsHome extends StatelessWidget {
  const SettingsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Theme'),
          ),
          ListTile(
            title: const Text('Language'),
          )
        ],
      ),
    );
  }
}
