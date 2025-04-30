import 'package:flutter/material.dart' hide ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xiphone/config/theme/theme_repository.dart';

import 'theme_settings.dart';

class ThemeModeNotifier  extends StateNotifier<AsyncValue<AppThemeMode>>{
  final ThemeRepository _repository;

  ThemeModeNotifier(this._repository) : super(const AsyncValue.loading()) {
    _init();
  }

  Future <void> _init () async {
    final settings = await _repository.getThemeSettings();

    state = AsyncValue.data(settings.themeMode);
  }

  Future<void> setThemeMode (AppThemeMode mode ) async {
    state = const AsyncValue.loading();

    try {
      await _repository.updateThemeMode(mode);
      state = AsyncValue.data(mode);
    } catch (e, stack){
      state = AsyncValue.error(e, stack);
    }
  }
}