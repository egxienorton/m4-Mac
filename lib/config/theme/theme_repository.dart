import 'package:isar/isar.dart';
import 'package:xiphone/config/theme/theme_settings.dart';

class ThemeRepository {
  final Future<Isar> isar;

  ThemeRepository(this.isar);

  Future<ThemeSettings> getThemeSettings() async {

    final isarDb = await isar;
    ThemeSettings? settings = await isarDb.themeSettings.get(0);

    if (settings == null) {
      settings = ThemeSettings();

      await isarDb.writeTxn(() async {
        await isarDb.themeSettings.put(settings!);
      });
    }
    return settings;
  }

  Future<void> saveThemeSettings(ThemeSettings settings) async {
    final isarDb = await isar;
    await isarDb.writeTxn(() async {
      await isarDb.themeSettings.put(settings);
    });
  }

  Future<void> updateThemeMode(AppThemeMode mode) async {
    final isarDb = await isar;
    await isarDb.writeTxn(() async {
      ThemeSettings? settings = await isarDb.themeSettings.get(0);

      if (settings == null) {
        settings = ThemeSettings();
      }
      settings.themeMode = mode;
      await isarDb.themeSettings.put(settings);
    });
  }
}
