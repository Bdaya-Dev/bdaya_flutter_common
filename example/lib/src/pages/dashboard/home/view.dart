import 'package:example/common.dart';
import 'controller.dart';
import 'package:go_router/go_router.dart';
class DashboardHomeView extends StatelessWidget {
  const DashboardHomeView({
    super.key,
    required this.controller,
  });

  final DashboardHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Dashboard Home View'),
        ElevatedButton(
          onPressed: () => context.goNamed(AppRouteNames.kOrders),
          child: const Text('Go to orders'),
        ),
        ElevatedButton(
          onPressed: () => context.goNamed(AppRouteNames.kUsers),
          child: const Text('Go to Users'),
        ),
      ],
    );
  }
}
