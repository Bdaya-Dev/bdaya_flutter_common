import 'dart:async';

import 'package:flutter/foundation.dart';

class BdayaStreamToListenable extends ChangeNotifier {
  BdayaStreamToListenable(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (_) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

extension StreamToListenableExt on Stream {
  BdayaStreamToListenable toListenable() => BdayaStreamToListenable(this);
}
