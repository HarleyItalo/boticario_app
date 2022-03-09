import 'package:boticario_app/common/module/base_module.dart';
import 'package:boticario_app/modules/login/login_module.dart';
import 'package:boticario_app/modules/splash/splash_module.dart';

class InitModules {
  init() {
    SplashModule().registerModule();
    LoginModule().registerModule();
  }
}
