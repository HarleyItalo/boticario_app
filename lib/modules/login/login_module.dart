import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/module/base_module.dart';
import 'package:boticario_app/modules/login/controllers/login_controller.dart';
import 'package:boticario_app/modules/login/views/login_page/login_page.dart';

class LoginModule implements BaseModule {
  @override
  registerModule() {
    DependencyService.lazyRegister(LoginController());
    DependencyService.lazyRegister(
        LoginPage(controller: DependencyService.instance()));
  }
}
