import 'package:example/common.dart';
import 'package:example/src/pages/dashboard/_shell/controller.dart';

@lazySingleton
class UsersController extends BdayaCombinedRouteController {
  final DashboardShellController dashboardShellController;

  UsersController(this.dashboardShellController);
  @override
  void onRouteInformationChanged(GoRouterRouteMatch route) {}
}
