import 'package:example/common.dart';

@LazySingleton(as: AppThemeServiceBase)
class RemoteAppThemeService extends AppThemeServiceBase {
  @override
  Future<void> init() async {}

  @override
  Future<void> setLocale(Locale newLocale) async {
    throw UnimplementedError();
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    throw UnimplementedError();
  }
}
