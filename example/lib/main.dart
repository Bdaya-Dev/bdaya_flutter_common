import 'package:flutter/material.dart';

import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';

import 'get_it_config.dart';
import 'src/app.dart';

void main() {
  setPathUrlStrategy();
  configureBdayaDependencies(getIt);
  configureDependencies();
  runApp(SharedValue.wrapApp(const ExampleApp()));
}
