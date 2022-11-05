import 'package:example/common.dart';
import 'package:async/async.dart';

@lazySingleton
class InitService {
  final initMemo = AsyncMemoizer<void>();

  Future<void> init(BuildContext context) =>
      initMemo.runOnce(() => Future.wait([
            //parallel init

            //delay for 3 seconds to get a chance to display animations,logo,etc...
            Future.delayed(const Duration(seconds: 3)),
            //actual init sequence
            _sequentialInit(context),
          ]));

  Future<void> _sequentialInit(BuildContext context) async {
    //init
    await getIt<AuthService>().init();
    await getIt<BdayaAppThemeServiceBase>().init();
  }
}
