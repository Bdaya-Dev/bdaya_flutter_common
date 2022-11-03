// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bdaya_flutter_common/src/services/app_theme_service.dart'
    as _i3;
import 'package:bdaya_flutter_common/src/services/go_router_refresh_service.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initBdayaGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AppThemeServiceBase>(() => _i3.LocalAppThemeService());
  gh.lazySingleton<_i4.GoRouterRefreshService>(
    () => _i4.GoRouterRefreshService(),
    dispose: (i) => i.dispose(),
  );
  return get;
}
