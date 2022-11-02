import 'package:logging/logging.dart';

mixin BdayaLoggableMixin {
  late final logger = Logger('$runtimeType($hashCode)');
}
