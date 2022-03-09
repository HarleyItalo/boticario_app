import 'package:boticario_app/modules/login/views/login_page/login_page.dart';
import 'package:boticario_app/modules/splash/views/splash_page.dart';

import '../../../common/dependency_inject/dependency_inject.dart';

class Routes {
  static const String splash = "/";
  static const String login = "/login";

  static get getRoutes => {
        splash: (_) => DependencyService.instance<SplashPage>(),
        login: (_) => DependencyService.instance<LoginPage>()
      };
}
