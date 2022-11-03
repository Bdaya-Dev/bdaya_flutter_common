import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'get_it_config.config.dart';

// final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initBdayaGetIt', // default
  preferRelativeImports: false, // default
  asExtension: false, // default
)
GetIt configureBdayaDependencies(GetIt instance) {
  instance.allowReassignment = true;
  return $initBdayaGetIt(instance);
}
