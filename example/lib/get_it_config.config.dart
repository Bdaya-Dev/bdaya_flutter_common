// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example/common.dart' as _i4;
import 'package:example/injectable_module.dart' as _i14;
import 'package:example/src/pages/_shell/controller.dart' as _i3;
import 'package:example/src/pages/auth/auth_controller.dart' as _i6;
import 'package:example/src/pages/dashboard/_shell/controller.dart' as _i9;
import 'package:example/src/pages/dashboard/home/controller.dart' as _i8;
import 'package:example/src/pages/dashboard/order_details/controller.dart'
    as _i11;
import 'package:example/src/pages/dashboard/orders/controller.dart' as _i12;
import 'package:example/src/pages/public/home/controller.dart' as _i13;
import 'package:example/src/services/auth_service.dart' as _i7;
import 'package:example/src/services/init_service.dart' as _i10;
import 'package:example/src/services/remote_app_theme_service.dart' as _i5;
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
  gh.lazySingleton<_i3.AppShellController>(() => _i3.AppShellController());
  gh.lazySingleton<_i4.AppThemeServiceBase>(() => _i5.RemoteAppThemeService());
  gh.lazySingleton<_i6.AuthController>(
      () => _i6.AuthController(get<_i4.AuthService>()));
  gh.lazySingleton<_i7.AuthService>(
      () => _i7.MockAuthService(get<_i4.GoRouterRefreshService>()));
  gh.lazySingleton<_i8.DashboardHomeController>(
      () => _i8.DashboardHomeController());
  gh.lazySingleton<_i9.DashboardShellController>(
      () => _i9.DashboardShellController(get<_i4.AuthService>()));
  gh.lazySingleton<_i4.GoRouter>(
      () => registerModule.getRouter(get<_i4.GoRouterRefreshService>()));
  gh.lazySingleton<_i10.InitService>(() => _i10.InitService());
  gh.lazySingleton<_i11.OrderDetailsController>(
      () => _i11.OrderDetailsController(get<_i9.DashboardShellController>()));
  gh.lazySingleton<_i12.OrdersController>(
      () => _i12.OrdersController(get<_i9.DashboardShellController>()));
  gh.lazySingleton<_i13.PublicHomeController>(
      () => _i13.PublicHomeController());
  return get;
}

class _$RegisterModule extends _i14.RegisterModule {}
