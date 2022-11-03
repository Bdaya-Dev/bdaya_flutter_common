import 'package:example/common.dart';
import 'package:injectable/injectable.dart';

abstract class AuthService with BdayaLoggableMixin {
  final isAuthed = SharedValue(
    value: false,
    key: 'isAuthed',
    customEncode: (val) => val.toString().toLowerCase(),
    customDecode: (val) => val == 'true',
  );

  Future<void> init() async {
    await isAuthed.load();
  }

  Future<void> login();
  Future<void> logout();
}

@LazySingleton(as: AuthService)
class MockAuthService extends AuthService {
  @override
  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
    isAuthed.$ = true;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    isAuthed.$ = false;
  }
}
