

import 'package:flutter/material.dart' hide ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xiphone/config/theme/theme_provider.dart';

import 'theme_settings.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeProvider);
    
    return themeModeAsync.when(data: (themeMode) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<AppThemeMode>(
            title: const Text('Light Theme'),
            value: AppThemeMode.light, 
            groupValue: themeMode,
            onChanged: (value){
              if(value!=null) {
                ref.read(themeModeProvider.notifier).setThemeMode(themeMode);
              }
            },),

            RadioListTile<AppThemeMode>(
              title: const Text('Dark Theme'),
              value: AppThemeMode.dark, 
              groupValue: themeMode, 
              onChanged: (value){
                if(value != null){
                  ref.read(themeModeProvider.notifier).setThemeMode(themeMode);
                }
              },),
        ],
      );
    }, error: (err, stack) => Text('Error : $err'), 
    loading: ()=> const CircularProgressIndicator());
  }
}