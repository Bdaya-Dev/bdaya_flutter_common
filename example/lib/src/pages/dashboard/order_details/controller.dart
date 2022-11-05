import 'package:example/common.dart';

import '../_shell/controller.dart';

@lazySingleton
class OrderDetailsController extends BdayaCombinedRouteController {
  final DashboardShellController dashboardShellController;

  late final orderId = SharedValue<String>(value: currentOrderId!);
  late final queryParams =
      SharedValue<Map<String, String>>(value: currentQueryParams);

  OrderDetailsController(this.dashboardShellController);

  String? get currentOrderId => currentConfiguration?.decodedParams[kOrderId];
  Map<String, String> get currentQueryParams =>
      currentConfiguration?.decodedParams ?? {};

  @override
  void onRouteInformationChanged(GoRouterRouteMatch route) {
    //this gets called for route changes to current (or child) routes
    final oid = currentOrderId;
    if (oid != null) {
      orderId.$ = oid;
    }
    queryParams.$ = route.queryParams;
  }

  void onQueryParamsChanged(Map<String, String> newParams) {
    //
    logger.info('QueryParams changed: $newParams');
  }

  Future<void> initFromOrderId(String orderId) async {
    //Initialization logic
    logger.info('Initializing orderId $orderId, queryParams: ${queryParams.$}');
  }

  @override
  void beforeRender(BuildContext context) {
    super.beforeRender(context);
    registerStream(
      orderId.streamWithInitial.distinct().listen(initFromOrderId),
    );
    registerStream(
      queryParams.streamWithInitial.listen(onQueryParamsChanged),
    );
  }
}