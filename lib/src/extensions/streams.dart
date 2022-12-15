import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';

extension LogStreamsExt<T> on Stream<T> {
  Stream<T> wrapWithArea(BdayaRxLoadableArea area, [Logger? logger, String? message]) {
    return doOnListen(() {
      area.startLoading();
      logger?.finest('[${area.$.displayName}] Started loading');
    }).doOnData(
      (event) {
        area.stopLoadingSuccess();
        logger?.finest('[${area.$.displayName}] Stopped loading successfully');
      },
    ).doOnError(
      (error, stackTrace) => area.stopLoadingError(error, stackTrace, logger, message),
    );
  }
}
