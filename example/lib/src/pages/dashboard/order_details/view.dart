import 'dart:math';

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
    final queryParams = controller.queryParams.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Order details: $orderId'),
          Text('Query params: $queryParams'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.goNamed(
              AppRouteNames.kOrders,
            ),
            child: const Text("Go to all orders (parent navigation)"),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final newId =
                  controller.dashboardShellController.generateRandomOrderId();
              context.goNamed(
                AppRouteNames.kOrderDetails,
                params: {
                  kOrderId: newId,
                },
                extra: newId,
              );
            },
            child: const Text(
                "Go to another random order (same route navigation)"),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final newNumber = Random().nextInt(1000);
              //shouldn't call initFromOrderId
              context.goNamed(AppRouteNames.kOrderDetails, params: {
                kOrderId: orderId,
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
