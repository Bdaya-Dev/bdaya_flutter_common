// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example/common.dart' as _i3;
import 'package:example/injectable_module.dart' as _i17;
import 'package:example/src/pages/_shell/controller.dart' as _i4;
import 'package:example/src/pages/auth/controller.dart' as _i16;
import 'package:example/src/pages/dashboard/_shell/controller.dart' as _i8;
import 'package:example/src/pages/dashboard/home/controller.dart' as _i7;
import 'package:example/src/pages/dashboard/order_details/controller.dart'
    as _i11;
import 'package:example/src/pages/dashboard/orders/controller.dart' as _i12;
import 'package:example/src/pages/dashboard/user_details/controller.dart'
    as _i14;
import 'package:example/src/pages/dashboard/users/controller.dart' as _i15;
import 'package:example/src/pages/public/home/controller.dart' as _i13;
import 'package:example/src/services/auth_service.dart' as _i5;
import 'package:example/src/services/init_service.dart' as _i10;
import 'package:example/src/services/remote_app_theme_service.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.BdayaFlutterCommonPackageModule().init(gh);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i4.AppShellController>(() => _i4.AppShellController());
    gh.lazySingleton<_i5.AuthService>(() => _i5.MockAuthService());
    gh.lazySingleton<_i3.BdayaAppThemeServiceBase>(
        () => _i6.RemoteAppThemeService());
    gh.lazySingleton<_i7.DashboardHomeController>(
        () => _i7.DashboardHomeController());
    gh.lazySingleton<_i8.DashboardShellController>(
        () => _i8.DashboardShellController(gh<_i3.AuthService>()));
    gh.lazySingleton<_i9.GoRouter>(() => registerModule.getRouter());
    gh.lazySingleton<_i10.InitService>(() => _i10.InitService());
    gh.lazySingleton<_i11.OrderDetailsController>(
        () => _i11.OrderDetailsController(gh<_i8.DashboardShellController>()));
    gh.lazySingleton<_i12.OrdersController>(
        () => _i12.OrdersController(gh<_i8.DashboardShellController>()));
    gh.lazySingleton<_i13.PublicHomeController>(
        () => _i13.PublicHomeController());
    gh.factoryParam<_i14.UserDetailsController, String, dynamic>((
      userId,
      _,
    ) =>
        _i14.UserDetailsController(
          gh<_i8.DashboardShellController>(),
          userId,
        ));
    gh.lazySingleton<_i15.UsersController>(
        () => _i15.UsersController(gh<_i8.DashboardShellController>()));
    gh.lazySingleton<_i16.AuthController>(
        () => _i16.AuthController(gh<_i3.AuthService>()));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
