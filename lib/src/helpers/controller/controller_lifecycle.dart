import 'package:flutter/widgets.dart';
import 'loggable_mixin.dart';

/// Should always be used with [useViewController] hook
mixin BdayaLifeCycleMixin on BdayaLoggableMixin {
  /// Equal to [State.initState]
  @mustCallSuper
  void beforeRender(BuildContext context) {
    logger.fine('beforeRender');
  }

  /// Called after UI has been rendered for the first time
  ///
  /// useful when putting global keys in the controller, since you can access their state here
  @mustCallSuper
  void afterRender(BuildContext context) {
    logger.fine('afterRender');
  }

  /// Equal to [State.dispose]
  @mustCallSuper
  void onDispose(BuildContext context) {
    logger.fine('onDispose');
  }
}