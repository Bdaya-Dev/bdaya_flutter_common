import 'package:example/common.dart';

@LazySingleton(as: AppThemeServiceBase)
class RemoteAppThemeService extends AppThemeServiceBase {
  @override
  Future<void> init() async {
    logger.fine('Initializing ...');
    //simulate wait due to a server request
    await Future.delayed(const Duration(seconds: 1));
    await themeMode.load();
    await locale.load();
    logger.fine('Initialization Done.');
  }

  @override
  Future<void> setLocale(Locale newLocale) async {
    logger.fine('Setting Locale ...');
    //first assign locally
    locale.$ = newLocale;
    //simulate wait due to a server request
    await Future.delayed(const Duration(seconds: 1));
    await locale.save();
    logger.fine('Setting Locale Done.');
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    logger.fine('Setting Theme Mode ...');
    //first assign locally
    themeMode.$ = mode;
    //simulate wait due to a server request
    await Future.delayed(const Duration(seconds: 1));
    await themeMode.save();
    logger.fine('Setting Theme Mode Done.');
  }
}
