import 'package:boticario_app/modules/login/domain/models/login_model.dart';
import 'package:boticario_app/modules/register_user/domain/models/register_user_model.dart';

abstract class LoginRepository {
  Future<UserModel?> findUser(LoginModel loginModel);
  Future<UserModel?> getUserLogged();
  Future<bool> makeLogout();
}
