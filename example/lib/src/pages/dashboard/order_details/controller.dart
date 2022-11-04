import 'package:example/common.dart';

import '../_shell/controller.dart';

@lazySingleton
class OrderDetailsController extends BdayaCombinedRouteController {
  final DashboardShellController dashboardShellController;

  late final orderId = SharedValue<String?>(value: null);

  OrderDetailsController(this.dashboardShellController);

  @override
  void onRouteInformationChanged(GoRouterRouteMatch route) {
    // goRouter.location;
    final params = route.decodedParams;
    orderId.$ = params[kOrderId];
  }
}
