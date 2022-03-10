import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/module/base_module.dart';
import 'package:boticario_app/modules/register_user/controllers/register_user_controller.dart';
import 'package:boticario_app/modules/register_user/views/register_user_page.dart';

class RegisterUserModule implements BaseModule {
  @override
  registerModule() {
    DependencyService.lazyRegister(RegisteUserController());
    DependencyService.lazyRegister(
        RegisterUserPage(controller: DependencyService.instance()));
  }
}
