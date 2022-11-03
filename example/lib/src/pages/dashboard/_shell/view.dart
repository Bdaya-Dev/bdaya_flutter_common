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
    return child;
  }
}
