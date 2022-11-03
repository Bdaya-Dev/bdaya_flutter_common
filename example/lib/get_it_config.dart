import 'package:example/common.dart';
import 'package:injectable/injectable.dart';
import 'get_it_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: false, // default
  asExtension: false, // default
  ignoreUnregisteredTypesInPackages: ['example/common.dart'],
)
void configureDependencies() => $initGetIt(getIt);
