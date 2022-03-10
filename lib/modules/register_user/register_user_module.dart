import 'package:boticario_app/common/dependency_inject/dependency_inject.dart';
import 'package:boticario_app/common/module/base_module.dart';
import 'package:boticario_app/modules/register_user/controllers/register_user_controller.dart';
import 'package:boticario_app/modules/register_user/domain/repositories/register_user_repository.dart';
import 'package:boticario_app/modules/register_user/domain/user_cases/register_user.dart';
import 'package:boticario_app/modules/register_user/infra/repositories/register_user_repository_impl.dart';
import 'package:boticario_app/modules/register_user/views/register_user_page.dart';

class RegisterUserModule implements BaseModule {
  @override
  registerModule() {
    DependencyService.lazyRegister<RegisterUserRepository>(
        RegisterUserRepositoryImpl(DependencyService.instance()));
    DependencyService.lazyRegister<RegisterUser>(
        RegisterUserImpl((DependencyService.instance())));
    DependencyService.lazyRegister(
        RegisteUserController((DependencyService.instance())));
    DependencyService.lazyRegister(
        RegisterUserPage(controller: DependencyService.instance()));
  }
}
