import 'dart:math';

import 'package:example/common.dart';

@lazySingleton
class DashboardShellController extends BdayaCombinedController {
  final AuthService authService;
  final random = Random();

  DashboardShellController(this.authService);

  String generateRandomOrderId() => List.generate(
        16,
        (index) => (random.nextInt(9) + 1).toString(),
      ).join();

  Future<void> doLogout() async {
    startLoading();
    try {
      await authService.logout();
      stopLoadingSuccess();
    } catch (e, st) {
      stopLoadingError(e, st, logger, 'Error while logging out');
    }
  }
}
