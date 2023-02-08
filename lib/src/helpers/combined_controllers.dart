import 'controller/dispose_handler_mixin.dart';
import 'router/router_listenable_mixin.dart';
import 'controller/controller_lifecycle.dart';
import 'controller/is_loading_mixin.dart';
import 'controller/loggable_mixin.dart';

/// For all controllers (Dialogs + Pages)
abstract class BdayaCombinedController with BdayaLoggableMixin, BdayaLifeCycleMixin, BdayaIsLoadingMixin, BdayaDisposeHandlerMixin {}

/// For page controllers that require route information
abstract class BdayaCombinedRouteController extends BdayaCombinedController with BdayaRouterListenableMixin {}
