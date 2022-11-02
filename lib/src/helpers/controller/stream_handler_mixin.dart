import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

import 'controller_lifecycle.dart';

mixin BdayaStreamHandlerMixin on BdayaLifeCycleMixin {
  final _subs = <StreamSubscription>[];
  final _listenables = <Tuple2<Listenable, VoidCallback>>[];

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
    _listenables.add(Tuple2(l, callback));
    if (callbackNow) {
      callback();
    }
  }

  @override
  void onDispose(BuildContext context) {
    for (var element in _subs) {
      element.cancel();
    }
    for (var element in _listenables) {
      element.item1.removeListener(element.item2);
    }
    _listenables.clear();
    _subs.clear();
    super.onDispose(context);
  }
}
