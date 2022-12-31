import 'package:logging/logging.dart';

String Function(Object) bdayaDefaultLoggerName = (p0) {
  return '${p0.runtimeType}(${p0.hashCode})';
};
mixin BdayaLoggableMixin {
  String get loggerName => bdayaDefaultLoggerName(this);
  late final logger = Logger(loggerName);
}
