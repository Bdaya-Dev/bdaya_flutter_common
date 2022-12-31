import 'dart:math';

import 'package:example/common.dart';
import 'controller.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({
    super.key,
    required this.controller,
  });

  final UserDetailsController controller;

  @override
  Widget build(BuildContext context) {
    final userId = controller.userId;
    final queryParams = controller.queryParams.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('User details: $userId'),
          Text('Query params: $queryParams'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.goNamed(
              AppRouteNames.kUsers,
            ),
            child: const Text("Go to all users (parent navigation)"),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final newId = controller.dashboardShellController.generateRandomId();
              context.goNamed(
                AppRouteNames.kUserDetails,
                params: {
                  kUserId: newId,
                },
                extra: newId,
              );
            },
            child: const Text("Go to another random user (same route navigation)"),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final newNumber = Random().nextInt(1000);
              //shouldn't call initFromOrderId
              context.goNamed(AppRouteNames.kUserDetails, params: {
                kUserId: userId,
              }, queryParams: {
                'number': newNumber.toString(),
              });
            },
            child: const Text(
              "Change query parameters (self navigation)",
            ),
          ),
        ],
      ),
    );
  }
}
