// import 'package:flutter/material.dart';
// import 'package:riverpod/riverpod.dart';


// final sharedPrefProvider = FutureProvider((ref){
//   return SharedPreferences.getInstance();
// });

// final themeSwitchProvider = StateProvider((ref){
//   final sharedPreferences = ref.watch(sharedPrefProvider);

//   final theme = sharedPreferences.value?.getString("themeMode");

//   return theme == "dark"? true: false;
// });

// final themeModeProvider = StateProvider<ThemeMode>((ref){
//   final sharedPreferences = ref.watch(sharedPrefProvider);
//   final themeSwitch = ref.watch(themeSwitchProvider);

//   if(themeSwitch){
//     sharedPreferences.value?.setString("themeMode", "dark");
//   }else {
//     sharedPreferences.value?.setString("themeMode", "light");
//   }
//   final theme = sharedPreferences.value?.getString("themeMode");

//   return theme == "dark" ? ThemeMode.dark : ThemeMode.light;
// });


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:xiphone/App/Providers/providers.dart';
import 'package:xiphone/bootstrap/services/isar_service.dart';
import 'package:xiphone/config/theme/theme_repository.dart';
import 'package:xiphone/config/theme/theme_settings.dart';

import 'theme_mode_notifier.dart';

final themeRepositoryProvider = Provider<ThemeRepository>((ref)   {
  final existingIsarInstance = ref.read(isarServiceProvider);

  return ThemeRepository( existingIsarInstance.db);
});



final themeSettingsProvider = FutureProvider<ThemeSettings> ((ref) {
  final repository = ref.watch(themeRepositoryProvider);
  return  repository.getThemeSettings();
});

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, AsyncValue<AppThemeMode>>((ref){
 final repository = ref.watch(themeRepositoryProvider);
 return ThemeModeNotifier(repository);
});