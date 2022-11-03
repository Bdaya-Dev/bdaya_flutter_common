import 'package:example/common.dart';
import 'package:example/src/services/auth_service.dart';

@lazySingleton
class AuthController extends BdayaCombinedController {
  final AuthService authService;

  AuthController(this.authService);

  Future<void> login() async {
    isLoading.$ = true;
    try {
      await authService.login();
    } catch (e, st) {
      logger.severe("Error occured while logging in", e, st);
    } finally {
      isLoading.$ = false;
    }
  }

  Future<void> logout() async {
    isLoading.$ = true;
    try {
      await authService.logout();
    } catch (e, st) {
      logger.severe("Error occured while logging out", e, st);
    } finally {
      isLoading.$ = false;
    }
  }
}
