import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
// ignore: implementation_imports
import 'package:go_router/src/match.dart';
import '../controller/stream_handler_mixin.dart';

typedef GoRouterRouteMatch = RouteMatch;
mixin RouterListenableMixin on BdayaStreamHandlerMixin {
  /// gets called every time the RouteInformation changes,
  void onRouteInformationChanged(GoRouterRouteMatch route);
  bool get callOnRouteChangedInitially => true;
  void _onRouteInformationChanged() {
    //goRouter.uri;
    final value = goRouter.routerDelegate.currentConfiguration;

    onRouteInformationChanged(value.last);

    logger.finest(
      'onRouteInformationChanged, location: ${goRouter.location}, extra: ${value.extra}',
    );
  }

  GoRouter get goRouter => GetIt.I<GoRouter>();
  // GoRouterState get currentRouterState => GetIt.I<GoRouterState>();

  @override
  void beforeRender(BuildContext context) {
    super.beforeRender(context);
    registerListenable(
      goRouter,
      _onRouteInformationChanged,
      callbackNow: callOnRouteChangedInitially,
    );
  }
}
