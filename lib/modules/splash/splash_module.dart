import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/module/base_module.dart';

import 'package:boticario_app/modules/splash/views/splash_page.dart';

import 'controllers/splash_controller.dart';

class SplashModule extends BaseModule {
  @override
  registerModule() {
    DependencyService.lazyRegister(SplashController());
    DependencyService.lazyRegister(
        SplashPage(controller: DependencyService.instance()));
  }
}
