import 'package:example/common.dart';

abstract class AuthService with BdayaLoggableMixin {
  final GoRouterRefreshService refreshService;
  final isAuthed = SharedValue(
    value: false,
    key: 'isAuthed',
    customEncode: (val) => val.toString().toLowerCase(),
    customDecode: (val) => val == 'true',
  );

  AuthService(this.refreshService);

  Future<void> init() async {
    refreshService.registerStream(isAuthed.stream);
    await isAuthed.load();
  }

  Future<void> login();
  Future<void> logout();
}

@LazySingleton(as: AuthService)
class MockAuthService extends AuthService {
  MockAuthService(super.refreshService);

  @override
  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
    isAuthed.$ = true;
    await isAuthed.save();
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    isAuthed.$ = false;
    await isAuthed.save();
  }
}
