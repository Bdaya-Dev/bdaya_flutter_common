import 'package:example/common.dart';

@lazySingleton
class AuthController extends BdayaCombinedController {
  final AuthService authService;

  AuthController(this.authService);

  Future<void> login() async {
    startLoading();
    try {
      await authService.login();
      stopLoadingSuccess();
    } catch (e, st) {
      stopLoadingError(e, st, logger, "Error occured while logging in");
    }
  }

  Future<void> logout() async {
    startLoading();
    try {
      await authService.logout();
      stopLoadingSuccess();
    } catch (e, st) {
      stopLoadingError(e, st, logger, "Error occured while logging out");
    }
  }
}
