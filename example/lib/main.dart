import 'package:flutter/material.dart';

import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';

import 'get_it_config.dart';
import 'src/app.dart';

void main() {
  //[Optional] change default logger name
  // bdayaDefaultLoggerName = (p0) {
  //   return p0.runtimeType.toString();
  // };

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    bdayaOnRecordHandlerFactory(
      showSequenceNumber: false,
      showTime: false,
    ),
  );
  setPathUrlStrategy();
  getIt.allowReassignment = true;
  configureDependencies();
  runApp(SharedValue.wrapApp(const ExampleApp()));
}
