import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

typedef GoRouterRouteMatch = RouteMatchList;
mixin BdayaRouterListenableMixin on BdayaDisposeHandlerMixin {
  /// gets called every time the RouteInformation changes,
  void onRouteInformationChanged(GoRouterRouteMatch route);
  GoRouterRouteMatch get currentConfiguration =>
      goRouter.routerDelegate.currentConfiguration;
  bool get callOnRouteChangedInitially => true;
  void _onRouteInformationChanged() {
    //goRouter.uri;
    final value = goRouter.routerDelegate.currentConfiguration;
    onRouteInformationChanged(value);
    if (this is BdayaLoggableMixin) {
      (this as BdayaLoggableMixin).logger.finest(
            'onRouteInformationChanged, location: ${value.uri.toString()}, extra: ${value.extra}',
          );
    }
  }

  GoRouter get goRouter => GetIt.I<GoRouter>();
  // GoRouterState get currentRouterState => GetIt.I<GoRouterState>();

  @override
  void beforeRender(BuildContext context) {
    super.beforeRender(context);
    registerListenable(
      goRouter.routerDelegate,
      _onRouteInformationChanged,
      callbackNow: callOnRouteChangedInitially,
    );
  }
}
