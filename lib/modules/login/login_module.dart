import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/module/base_module.dart';
import 'package:boticario_app/modules/login/controllers/login_controller.dart';
import 'package:boticario_app/modules/login/domain/user_cases/make_login_user_case.dart';
import 'package:boticario_app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:boticario_app/modules/login/views/login_page/login_page.dart';

import 'domain/repositories/login_repository.dart';

class LoginModule implements BaseModule {
  @override
  registerModule() {
    DependencyService.lazyRegister<LoginRepository>(
        LoginRepositoryImpl(DependencyService.instance()));
    DependencyService.lazyRegister<MakeLogin>(
        MakeLoginImpl(DependencyService.instance()));
    DependencyService.lazyRegister(
        LoginController(DependencyService.instance()));
    DependencyService.lazyRegister(
        LoginPage(controller: DependencyService.instance()));
  }
}
