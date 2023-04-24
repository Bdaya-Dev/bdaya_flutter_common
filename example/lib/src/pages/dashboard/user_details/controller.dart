import 'package:example/common.dart';

import '../_shell/controller.dart';

@injectable
class UserDetailsController extends BdayaCombinedController {
  final DashboardShellController dashboardShellController;

  final String userId;
  final queryParams = SharedValue<Map<String, String>>(value: {});
  UserDetailsController(
      this.dashboardShellController, @factoryParam this.userId);
  void onQueryParamsChanged(Map<String, String> newParams) {
    //
    logger.info('QueryParams changed: $newParams');
  }

  Future<void> initFromUserId(String userId) async {
    //Initialization logic
    logger.info('Initializing userId $userId, queryParams: ${queryParams.$}');
  }

  @override
  void beforeRender(BuildContext context) {
    super.beforeRender(context);
    initFromUserId(userId);
    registerStream(
      queryParams.streamWithInitial
          .distinct(const DeepCollectionEquality().equals)
          .listen(onQueryParamsChanged),
    );
  }
}
