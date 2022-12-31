import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
export 'package:ansicolor/ansicolor.dart';

void setAnsiColors(bool isEnabled) {
  ansiColorDisabled = !isEnabled;
}

final errorPen = AnsiPen()..red();
final infoPen = AnsiPen()..white();

void Function(LogRecord record) bdayaOnRecordHandlerFactory({
  bool showSequenceNumber = true,
  bool showLevel = true,
  bool showLoggerName = true,
  bool showTime = true,
  bool showError = true,
  bool showStackTrace = true,
}) {
  return (record) {
    AnsiPen? pen;
    final levelValue = record.level;
    final seqStr = showSequenceNumber ? '[${record.sequenceNumber}]' : '';
    final levelStr = showLevel ? '[${record.level.name}]' : '';
    final loggerNameStr = showLoggerName ? '[${record.loggerName}]' : '';

    final timeStr = showTime ? '[${record.time.toIso8601String()}]' : '';

    var msg = '$seqStr$levelStr$loggerNameStr$timeStr : ${record.message}';
    final err = record.error;
    final st = record.stackTrace;
    if (showError && err != null) {
      msg += '\n$err';
    }
    if (showStackTrace && st != null) {
      msg += '\n$st';
    }

    if (levelValue > Level.SEVERE) {
      pen = errorPen; //severe or shout => red
    } else {}

    debugPrint(pen?.write(msg) ?? msg);
  };
}
