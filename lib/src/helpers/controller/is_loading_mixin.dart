import 'package:bdaya_shared_value/bdaya_shared_value.dart';

mixin BdayaIsLoadingMixin {
  final isLoading = SharedValue<bool>(value: false);
}
