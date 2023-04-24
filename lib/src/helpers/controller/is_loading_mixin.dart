import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:flutter/widgets.dart';

typedef BdayaRxLoadableArea = SharedValue<BdayaLoadableArea>;

mixin BdayaIsLoadingMixin {
  final defaultArea = createLoadableArea(name: 'Default');
  bool isLoading(BuildContext context) {
    return defaultArea.of(context).isLoading;
  }

  BdayaLoadableArea getDefaultAreaValue(BuildContext context) {
    return defaultArea.of(context);
  }

  void startLoading() {
    defaultArea.startLoading();
  }

  void stopLoadingSuccess() {
    defaultArea.stopLoadingSuccess();
  }

  void stopLoadingError(Object error,
      [StackTrace? st, Logger? logger, String? message]) {
    defaultArea.stopLoadingError(error, st, logger, message);
  }

  static BdayaRxLoadableArea createLoadableArea({
    required String name,
    bool isLoading = false,
  }) {
    return BdayaRxLoadableArea(
      value: BdayaLoadableArea(
        displayName: name,
        isLoading: isLoading,
      ),
    );
  }

  BdayaRxLoadableArea withLoadableArea({
    required String name,
    bool isLoading = false,
  }) =>
      createLoadableArea(name: name, isLoading: isLoading);
}

extension BdayaLoadableAreaExt on BdayaRxLoadableArea {
  void startLoading() {
    update((p0) => p0.copyWith(isLoading: true, error: null, st: null));
  }

  void stopLoadingSuccess() {
    update((p0) => p0.copyWith(isLoading: false, error: null, st: null));
  }

  void stopLoadingError(Object error,
      [StackTrace? st, Logger? logger, String? message]) {
    update((p0) => p0.copyWith(isLoading: false, error: error, st: st));
    if (logger != null) {
      logger.severe(
          "[${$.displayName}] ${message ?? 'Error Occured:'}", error, st);
    }
  }
}
