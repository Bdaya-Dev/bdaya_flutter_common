import 'package:example/common.dart';
import 'controller.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    super.key,
    required this.controller,
  });

  final OrderDetailsController controller;

  @override
  Widget build(BuildContext context) {
    final orderId = controller.orderId.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Order details: $orderId'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.goNamed(
              AppRouteNames.kOrders,
            ),
            child: const Text("Go to all orders (parent navigation)"),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.goNamed(
              AppRouteNames.kOrderDetails,
              params: {
                kOrderId:
                    controller.dashboardShellController.generateRandomOrderId()
              },
            ),
            child: const Text(
                "Go to another random order (same route navigation)"),
          ),
        ],
      ),
    );
  }
}
