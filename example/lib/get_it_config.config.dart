// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example/common.dart' as _i3;
import 'package:example/injectable_module.dart' as _i7;
import 'package:example/src/pages/auth/auth_controller.dart' as _i6;
import 'package:example/src/services/auth_service.dart' as _i5;
import 'package:example/src/services/remote_app_theme_service.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppThemeServiceBase>(() => _i4.RemoteAppThemeService());
  gh.lazySingleton<_i5.AuthService>(() => _i5.MockAuthService());
  gh.lazySingleton<_i3.GoRouter>(
      () => registerModule.getRouter(get<_i3.GoRouterRefreshService>()));
  gh.lazySingleton<_i6.AuthController>(
      () => _i6.AuthController(get<_i5.AuthService>()));
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}
