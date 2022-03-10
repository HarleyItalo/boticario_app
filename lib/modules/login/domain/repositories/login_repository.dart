import 'package:boticario_app/modules/login/domain/models/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel?> findUser(LoginModel loginModel);
  Future<LoginModel?> getUserLogged();
  Future<bool> makeLogout();
}
