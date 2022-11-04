import 'package:example/common.dart';
import 'get_it_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: false, // default
  asExtension: false, // default
  //to avoid warnings due to https://github.com/Milad-Akarie/injectable/issues/125
  ignoreUnregisteredTypesInPackages: ['example/common.dart'],
)
void configureDependencies() => $initGetIt(getIt);
