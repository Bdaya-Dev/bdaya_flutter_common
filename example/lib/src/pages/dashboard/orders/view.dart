import 'package:example/common.dart';
import 'controller.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({
    super.key,
    required this.controller,
  });

  final OrdersController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Orders View'),
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
                AppRouteNames.kOrderDetails,
                params: {
                  kOrderId:
                      controller.dashboardShellController.generateRandomId(),
                },
              );
            },
            child: const Text('Go to sample order'),
          ),
        ],
      ),
    );
  }
}
