import 'package:example/common.dart';
import 'auth_controller.dart';

class AuthView extends StatelessWidget {
  const AuthView({
    super.key,
    required this.controller,
  });
  final AuthController controller;
  @override
  Widget build(BuildContext context) {
    final isLoading = controller.isLoading.of(context);
    final authState = controller.authService.isAuthed.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Auth Screen'),
          const SizedBox(height: 8),
          if (isLoading)
            const CircularProgressIndicator()
          else
            ElevatedButton(
              onPressed: authState ? controller.logout : controller.login,
              child: Text(
                authState ? 'Logout' : 'Login',
              ),
            ),
        ],
      ),
    );
  }
}
