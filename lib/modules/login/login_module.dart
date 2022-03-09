import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/module/base_module.dart';
import 'package:boticario_app/modules/login/views/login_page.dart';

class LoginModule implements BaseModule {
  @override
  registerModule() {
    registerPages();
  }

  registerPages() {
    DependencyService.lazyRegister(LoginPage());
  }
}
