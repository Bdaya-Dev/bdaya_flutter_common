import 'package:example/common.dart';
import 'package:example/src/pages/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = getIt<BdayaAppThemeServiceBase>();
    final locale = themeService.locale.of(context);
    final themeMode = themeService.themeMode.of(context);
    return MaterialApp.router(
      title: 'Bdaya Common Sample App',
      builder: (context, child) => SplashScreen(child: child),
      routerConfig: getIt<GoRouter>(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        BdayaLocalizationsExample.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      themeMode: themeMode,
      supportedLocales: BdayaLocalizationsExample.delegate.supportedLocales,
    );
  }
}
