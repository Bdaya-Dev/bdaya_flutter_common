import 'package:example/src/services/init_service.dart';
import 'package:flutter/material.dart';

import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';

import 'get_it_config.dart';
import 'src/app.dart';

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(bdayaOnRecordHandler);
  setPathUrlStrategy();
  configureBdayaDependencies(getIt);
  configureDependencies();
  runApp(SharedValue.wrapApp(const ExampleApp()));
}
