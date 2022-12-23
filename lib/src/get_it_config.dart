import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// final getIt = GetIt.instance;

@InjectableInit.microPackage(
  // initializerName: r'$initBdayaGetIt', // default
  preferRelativeImports: false, // default
  // asExtension: false, // default
)
void initBdayaDependencies(GetIt instance) {}
