import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

/// Injects GoRouterState into the route tree
GoRouterState useRouterStateHook({
  required GoRouterState routerState,
  List<Object?>? keys,
}) {
  return use(
    _RouterStateHook(
      routerState: routerState,
      keys: keys,
    ),
  );
}

class _RouterStateHook extends Hook<GoRouterState> {
  const _RouterStateHook({
    required this.routerState,
    super.keys,
  });

  final GoRouterState routerState;

  @override
  HookState<GoRouterState, Hook<GoRouterState>> createState() =>
      __RouterStateHookState(
        routerState: routerState,
      );
}

class __RouterStateHookState
    extends HookState<GoRouterState, Hook<GoRouterState>> {
  final GoRouterState routerState;
  final logger = Logger('Hooks.RouterState');
  __RouterStateHookState({required this.routerState});
  @override
  void initHook() {
    super.initHook();
    logger.info(
      'registering router state with location: ${routerState.location}',
    );
    GetIt.I.registerSingleton<GoRouterState>(routerState);
    final testState = GetIt.I<GoRouterState>();
    if (routerState != testState) {
      throw Exception('Incorrect replaced instance');
    }
  }

  @override
  GoRouterState build(BuildContext context) {
    return routerState;
  }
}
