import 'package:example/common.dart';
import 'controller.dart';

class PublicHomeView extends StatelessWidget {
  const PublicHomeView({
    super.key,
    required this.controller,
  });
  final PublicHomeController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Public Home View"),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.goNamed(AppRouteNames.kDashboardHome),
            child: const Text('Go To Dashboard Home'),
          ),
        ],
      ),
    );
  }
}
