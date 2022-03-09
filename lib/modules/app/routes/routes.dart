import 'package:boticario_app/modules/splash/views/splash_page.dart';

import '../../../common/dependency_inject/dependency_inject.dart';

class Routes {
  static const String splash = "/";

  static get getRoutes => {
        splash: (_) => SplashPage(
              controller: DependencyService.instance(),
            ),
      };
}
