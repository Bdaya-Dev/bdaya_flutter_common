import 'package:example/common.dart';
import 'controller.dart';

class UsersView extends StatelessWidget {
  const UsersView({
    super.key,
    required this.controller,
  });

  final UsersController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Users View'),
          ElevatedButton(
            child: const Text('Go to public home'),
            onPressed: () {
              context.goNamed(AppRouteNames.kPublicHome);
            },
          ),
          ElevatedButton(
            child: const Text('Go to dashboard home'),
            onPressed: () {
              context.goNamed(AppRouteNames.kDashboardHome);
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                AppRouteNames.kUserDetails,
                params: {
                  kUserId: controller.dashboardShellController.generateRandomId(),
                },
              );
            },
            child: const Text('Go to sample user'),
          ),
        ],
      ),
    );
  }
}
