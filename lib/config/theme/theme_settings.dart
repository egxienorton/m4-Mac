


import 'package:flutter/material.dart';
import 'package:isar/isar.dart';


part 'theme_settings.g.dart';

@Collection()
class ThemeSettings {
  Id id = 0;



  @enumerated
  AppThemeMode themeMode = AppThemeMode.system;


  bool useDynamicColors = false;

  String primaryColorHex = "FF6200EE";
  
}


enum AppThemeMode {
  light,
  dark,
  system,
}