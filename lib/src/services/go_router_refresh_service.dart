import 'dart:async';

import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:flutter/foundation.dart';

/// should be registered as a singleton and passed to [GoRouteInformationProvider.refreshListenable]
@lazySingleton
class GoRouterRefreshService extends ChangeNotifier with BdayaLoggableMixin {
  final _subs = <StreamSubscription>[];

  bool skipNotifications = false;
  void registerStream(Stream s) {
    notifyListeners();
    _subs.add(s.listen((_) {
      if (skipNotifications) return;
      notifyListeners();
    }));
  }

  @disposeMethod
  @override
  void dispose() {
    for (var element in _subs) {
      element.cancel();
    }
    super.dispose();
  }
}
