import 'dart:async';

import 'package:flutter/foundation.dart';

class StreamToListenable extends ChangeNotifier {
  StreamToListenable(Stream<dynamic> stream) {
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
  StreamToListenable toListenable() => StreamToListenable(this);
}
