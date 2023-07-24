import 'dart:async';

import 'package:flutter/widgets.dart';

import 'controller_lifecycle.dart';

mixin BdayaDisposeHandlerMixin on BdayaLifeCycleMixin {
  final _subs = <StreamSubscription>[];
  final _listenables = <(Listenable, VoidCallback)>[];
  final _actions = <VoidCallback>[];

  void registerDisposableAction(VoidCallback dispose) {
    _actions.add(dispose);
  }

  void registerStream(StreamSubscription subscription) {
    _subs.add(subscription);
  }

  /// * [callback] the callback to get registered
  /// * [callbackNow] if true, calls callback() after registering the listenable
  void registerListenable(
    Listenable l,
    VoidCallback callback, {
    bool callbackNow = false,
  }) {
    l.addListener(callback);
    _listenables.add((l, callback));
    if (callbackNow) {
      callback();
    }
  }

  @override
  void onDispose(BuildContext context) {
    for (var element in _listenables) {
      element.$1.removeListener(element.$2);
    }
    for (var element in _actions) {
      element();
    }
    for (var element in _subs) {
      element.cancel();
    }

    _listenables.clear();
    _subs.clear();
    _actions.clear();
    super.onDispose(context);
  }
}
