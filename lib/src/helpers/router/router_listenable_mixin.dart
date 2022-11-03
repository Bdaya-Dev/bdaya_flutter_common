import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../controller/stream_handler_mixin.dart';

mixin RouterListenableMixin on BdayaStreamHandlerMixin {
  /// gets called every time the RouteInformation changes,
  void onRouteInformationChanged(RouteInformation routeInformation);
  bool get callOnRouteChangedInitially => true;
  void _onRouteInformationChanged() {
    final value = goRouter.routeInformationProvider.value;
    onRouteInformationChanged(value);
    logger.finest(
      'onRouteInformationChanged, location: ${value.location}, state: ${value.state}',
    );
  }

  //TODO(ahmednfwela): add SharedValue<GoRouterState> ?

  GoRouter get goRouter => GetIt.I<GoRouter>();
  GoRouterState get currentRouterState => GetIt.I<GoRouterState>();

  @override
  void beforeRender(BuildContext context) {
    super.beforeRender(context);
    registerListenable(
      goRouter.routeInformationProvider,
      _onRouteInformationChanged,
      callbackNow: callOnRouteChangedInitially,
    );
  }
}
