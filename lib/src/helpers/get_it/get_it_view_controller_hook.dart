import 'dart:async';

import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:flutter/widgets.dart';

enum BdayaGetItHookMode {
  singleton,
  lazySingleton,
  factory,
}

TController useBdayaViewController<TController extends Object>({
  BdayaGetItHookMode hookMode = BdayaGetItHookMode.lazySingleton,
  String? instanceName,
  Object? param1,
  Object? param2,
  List<Object?>? keys,
}) =>
    use(
      _BdayaViewControllerHook<TController>(
        instanceName: instanceName,
        keys: keys,
        param1: param1,
        param2: param2,
        hookMode: hookMode,
      ),
    );

class _BdayaViewControllerHook<TController extends Object>
    extends Hook<TController> {
  const _BdayaViewControllerHook({
    required this.instanceName,
    required super.keys,
    required this.param1,
    required this.param2,
    required this.hookMode,
  });
  final String? instanceName;
  final Object? param1;
  final Object? param2;
  final BdayaGetItHookMode hookMode;

  @override
  HookState<TController, Hook<TController>> createState() =>
      _BdayaViewControllerHookState<TController>();
}

class _BdayaViewControllerHookState<TController extends Object>
    extends HookState<TController, _BdayaViewControllerHook<TController>> {
  late TController controller;
  final logger = Logger('Hooks.ViewController');
  void setController() {
    controller = GetIt.I<TController>(
      instanceName: hook.instanceName,
      param1: hook.param1,
      param2: hook.param2,
    );
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
    setController();
  }

  @override
  void didUpdateHook(_BdayaViewControllerHook<TController> oldHook) {
    if (hook.instanceName != oldHook.instanceName ||
        hook.param1 != oldHook.param1 ||
        hook.param2 != oldHook.param2 ||
        hook.hookMode != oldHook.hookMode) {
      final d = _disposeCurrentController();
      void afterDispose() {
        setState(() => setController());
      }

      if (d is Future) {
        d.then(
          (value) => afterDispose(),
        );
      } else {
        afterDispose();
      }
    }
  }

  @override
  TController build(BuildContext context) {
    if (controller is BdayaLifeCycleMixin) {
      (controller as BdayaLifeCycleMixin).beforeEachBuild(context);
    }
    return controller;
  }

  FutureOr<void> _disposeCurrentController() {
    FutureOr<void> disposeIfPossible(TController cont) {
      if (cont is BdayaLifeCycleMixin) {
        return cont.onDispose(context);
      }
    }

    switch (hook.hookMode) {
      case BdayaGetItHookMode.lazySingleton:
        if (GetIt.I.isRegistered<TController>(instance: controller)) {
          return GetIt.I.resetLazySingleton<TController>(
            instance: controller,
            disposingFunction: disposeIfPossible,
          );
        } else {
          final controllerName = controller is BdayaLoggableMixin
              ? (controller as BdayaLoggableMixin).loggerName
              : bdayaDefaultLoggerName(controller);
          logger.warning(
              "dispose called on an instance that's not registered with GetIt ($controllerName)");
          return disposeIfPossible(controller);
        }
      case BdayaGetItHookMode.factory:
        //instances are never registed as a factory, so only dispose
        return disposeIfPossible(controller);
      case BdayaGetItHookMode.singleton:
        if (GetIt.I.isRegistered<TController>(instance: controller)) {
          logger.warning(
            "Hook mode singleton doesn't make since it will be disposed once, consider making this a global service instead, or switch to lazySingleton/factory",
          );
        } else {
          final controllerName = controller is BdayaLoggableMixin
              ? (controller as BdayaLoggableMixin).loggerName
              : bdayaDefaultLoggerName(controller);
          logger.warning(
              "dispose called on an instance that's not registered with GetIt ($controllerName)");
        }
        return disposeIfPossible(controller);
      default:
        throw ArgumentError.value(hook.hookMode, 'hookMode');
    }
  }

  @override
  FutureOr<void> dispose() => _disposeCurrentController();
}
