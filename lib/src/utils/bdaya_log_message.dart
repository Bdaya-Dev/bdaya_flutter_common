import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
export 'package:ansicolor/ansicolor.dart';

void setAnsiColors(bool isEnabled) {
  ansiColorDisabled = !isEnabled;
}

final errorPen = AnsiPen()..red();
final infoPen = AnsiPen()..white();
void bdayaOnRecordHandler(LogRecord record) {
  AnsiPen? pen;
  final levelValue = record.level;
  var msg =
      '[${record.sequenceNumber}][${record.level.name}] [${record.loggerName}] ${record.time} : ${record.message}';
  final err = record.error;
  final st = record.stackTrace;
  if (err != null) {
    msg += '\n$err';
  }
  if (st != null) {
    msg += '\n$st';
  }

  if (levelValue > Level.SEVERE) {
    pen = errorPen; //severe or shout => red
  } else {}

  debugPrint(pen?.write(msg) ?? msg);
}
