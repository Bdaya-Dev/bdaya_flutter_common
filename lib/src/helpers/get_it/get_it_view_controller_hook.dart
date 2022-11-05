import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

import '../controller/controller_lifecycle.dart';

TController useBdayaViewController<TController extends Object>({
  String? instanceName,
  List<Object>? keys,
}) =>
    use(
      _BdayaViewControllerHook<TController>(
        instanceName: instanceName,
        keys: keys,
      ),
    );

class _BdayaViewControllerHook<TController extends Object>
    extends Hook<TController> {
  const _BdayaViewControllerHook({
    required this.instanceName,
    required super.keys,
  });
  final String? instanceName;

  @override
  HookState<TController, Hook<TController>> createState() =>
      _BdayaViewControllerHookState<TController>();
}

class _BdayaViewControllerHookState<TController extends Object>
    extends HookState<TController, _BdayaViewControllerHook<TController>> {
  late TController controller;
  final logger = Logger('Hooks.ViewController');
  void setControllerFromInstanceName(String? instanceName) {
    controller = GetIt.I<TController>(instanceName: instanceName);
    if (controller is BdayaLifeCycleMixin) {
      final casted = controller as BdayaLifeCycleMixin;
      casted.beforeRender(context);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        casted.afterRender(context);
      });
    }
  }

  @override
  void initHook() {
    //init controller
    setControllerFromInstanceName(hook.instanceName);
  }

  @override
  void didUpdateHook(_BdayaViewControllerHook<TController> oldHook) async {
    super.didUpdateHook(oldHook);
    if (hook.instanceName != oldHook.instanceName) {
      final d = _disposeCurrentController();
      if (d is Future) {
        d.then(
          (value) =>
              setState(() => setControllerFromInstanceName(hook.instanceName)),
        );
      }
    }
  }

  @override
  TController build(BuildContext context) {
    return controller;
  }

  FutureOr<void> _disposeCurrentController() {
    if (GetIt.I.isRegistered<TController>(instance: controller)) {
      return GetIt.I.resetLazySingleton<TController>(
        instance: controller,
        disposingFunction: (cont) {
          if (cont is BdayaLifeCycleMixin) {
            cont.onDispose(context);
          }
        },
      );
    }
  }

  @override
  FutureOr<void> dispose() => _disposeCurrentController();
}
