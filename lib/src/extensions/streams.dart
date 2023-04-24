import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';

extension LogStreamsExt<T> on Stream<T> {
  Stream<T> wrapWithArea(BdayaRxLoadableArea area,
      [Logger? logger, String? message]) {
    return doOnListen(() {
      area.startLoading();
      logger?.finest('[${area.$.displayName}] Started loading');
    }).doOnData(
      (event) {
        area.stopLoadingSuccess();
        logger?.finest('[${area.$.displayName}] Stopped loading successfully');
      },
    ).doOnError(
      (error, stackTrace) =>
          area.stopLoadingError(error, stackTrace, logger, message),
    );
  }
}

extension LogFutureExt<T> on Future<T> {
  Future<T> wrapWithArea(BdayaRxLoadableArea area,
      [Logger? logger, String? message]) async {
    try {
      area.startLoading();
      logger?.finest('[${area.$.displayName}] Started loading');
      final res = await this;
      area.stopLoadingSuccess();
      logger?.finest('[${area.$.displayName}] Stopped loading successfully');
      return res;
    } catch (e, st) {
      area.stopLoadingError(e, st, logger, message);
      rethrow;
    }
  }
}
