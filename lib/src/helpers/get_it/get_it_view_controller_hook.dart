import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

import '../controller/controller_lifecycle.dart';

TController useViewController<TController extends Object>({
  String? instanceName,
  List<Object>? keys,
}) =>
    use(
      _ViewControllerHook<TController>(
        instanceName: instanceName,
        keys: keys,
      ),
    );

class _ViewControllerHook<TController extends Object>
    extends Hook<TController> {
  const _ViewControllerHook({
    required this.instanceName,
    required super.keys,
  });
  final String? instanceName;

  @override
  HookState<TController, Hook<TController>> createState() =>
      _ViewControllerHookState<TController>();
}

class _ViewControllerHookState<TController extends Object>
    extends HookState<TController, _ViewControllerHook<TController>> {
  late TController controller;
  final logger = Logger('Hooks.ViewController');

  @override
  void initHook() {
    //init controller
    controller = GetIt.I<TController>(instanceName: hook.instanceName);
    if (controller is BdayaLifeCycleMixin) {
      final casted = controller as BdayaLifeCycleMixin;
      casted.beforeRender(context);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        casted.afterRender(context);
      });
    }
  }

  @override
  TController build(BuildContext context) {
    return controller;
  }

  @override
  void dispose() async {
    if (GetIt.I.isRegistered<TController>(instance: controller)) {
      await GetIt.I.resetLazySingleton<TController>(
        instance: controller,
        instanceName: hook.instanceName,
        disposingFunction: (cont) {
          if (cont is BdayaLifeCycleMixin) {
            cont.onDispose(context);
          }
        },
      );
    }
  }
}
