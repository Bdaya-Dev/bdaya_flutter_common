import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

/// Injects GoRouterState into the route tree
GoRouterState useBdayaRouterStateHook({
  required GoRouterState routerState,
  List<Object?>? keys,
}) {
  return use(
    _BdayaRouterStateHook(
      routerState: routerState,
      keys: keys,
    ),
  );
}

class _BdayaRouterStateHook extends Hook<GoRouterState> {
  const _BdayaRouterStateHook({
    required this.routerState,
    super.keys,
  });

  final GoRouterState routerState;

  @override
  HookState<GoRouterState, Hook<GoRouterState>> createState() =>
      __BdayaRouterStateHookState();
}

class __BdayaRouterStateHookState
    extends HookState<GoRouterState, _BdayaRouterStateHook> {
  late GoRouterState routerState;

  final logger = Logger('Hooks.RouterState');

  @override
  void initHook() {
    super.initHook();
    routerState = hook.routerState;
    logger.info(
      'registering router state with location: ${routerState.uri.toString()}',
    );
    GetIt.I.registerSingleton<GoRouterState>(routerState);
    final testState = GetIt.I<GoRouterState>();
    if (routerState != testState) {
      throw Exception('Incorrect replaced instance');
    }
  }

  @override
  void didUpdateHook(_BdayaRouterStateHook oldHook) {
    super.didUpdateHook(oldHook);
    if (oldHook.routerState != hook.routerState) {
      routerState = hook.routerState;
    }
  }

  @override
  GoRouterState build(BuildContext context) {
    return routerState;
  }
}
