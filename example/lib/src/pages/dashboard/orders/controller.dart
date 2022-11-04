import 'package:example/common.dart';
import 'package:example/src/pages/dashboard/_shell/controller.dart';

@lazySingleton
class OrdersController extends BdayaCombinedRouteController {
  final DashboardShellController dashboardShellController;

  OrdersController(this.dashboardShellController);
  @override
  void onRouteInformationChanged(GoRouterRouteMatch route) {}
}
