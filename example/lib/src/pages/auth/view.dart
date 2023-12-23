import 'package:example/common.dart';
import 'controller.dart';

class AuthView extends StatelessWidget {
  const AuthView({
    super.key,
    required this.controller,
  });
  final AuthController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Auth Screen'),
          const SizedBox(height: 8),
          BdayaLoadableAreaWrapper.custom(
            area: controller.defaultArea,
            customBuilder: (context, area) {
              final authState = controller.authService.isAuthed.of(context);
              final rawError = area.error;
              String? error = rawError == null
                  ? null
                  : rawError is Exception //custom handling
                      ? rawError.toString()
                      : null;
              return Column(
                children: [
                  if (error != null) ...[
                    Text(error),
                    const SizedBox(height: 2),
                  ],
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: area.isLoading
                            ? null
                            : authState
                                ? controller.logout
                                : controller.login,
                        child: Text(
                          authState ? 'Logout' : 'Login',
                        ),
                      ),
                      if (area.isLoading) ...[
                        const CircularProgressIndicator(),
                        const SizedBox(width: 8),
                      ],
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
