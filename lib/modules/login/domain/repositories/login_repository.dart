import 'package:boticario_app/modules/login/domain/models/login_model.dart';

abstract class ILoginRepository {
  Future<bool> makeLogin(LoginModel loginModel);
  Future<bool> makeLogout();
}
