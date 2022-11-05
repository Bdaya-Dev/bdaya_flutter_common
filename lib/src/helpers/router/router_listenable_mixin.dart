import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
// ignore: implementation_imports
import 'package:go_router/src/match.dart';
import '../controller/stream_handler_mixin.dart';
import 'package:collection/collection.dart';

typedef GoRouterRouteMatch = RouteMatch;
mixin RouterListenableMixin on BdayaStreamHandlerMixin {
  /// gets called every time the RouteInformation changes,
  void onRouteInformationChanged(GoRouterRouteMatch route);
  GoRouterRouteMatch? get currentConfiguration =>
      goRouter.routerDelegate.currentConfiguration.matches.lastOrNull;
  bool get callOnRouteChangedInitially => true;
  void _onRouteInformationChanged() {
    //goRouter.uri;
    final value = goRouter.routerDelegate.currentConfiguration;

    onRouteInformationChanged(value.last);
    if (this is BdayaLoggableMixin) {
      (this as BdayaLoggableMixin).logger.finest(
            'onRouteInformationChanged, location: ${goRouter.location}, extra: ${value.extra}',
          );
    }
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
