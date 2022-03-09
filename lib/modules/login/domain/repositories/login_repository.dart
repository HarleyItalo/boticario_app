import 'package:boticario_app/modules/login/domain/models/login_model.dart';

abstract class ILoginRepository {
  Future<LoginModel> makeLogin(LoginModel loginModel);
  Future<bool> makeLogout();
}
