import 'package:example/common.dart';

import 'controller.dart';

class DashboardShellView extends StatelessWidget {
  const DashboardShellView({
    super.key,
    required this.controller,
    required this.child,
  });
  final DashboardShellController controller;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final isLoading = controller.isLoading.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Dashboard Shell',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const Spacer(),
              if (isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: controller.doLogout,
                  child: const Text("Logout"),
                ),
            ],
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
