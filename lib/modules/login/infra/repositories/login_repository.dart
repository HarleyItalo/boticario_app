import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/login/domain/models/login_model.dart';
import 'package:boticario_app/modules/login/domain/repositories/login_repository.dart';

class LoginRepository implements ILoginRepository {
  final IHttpService _httpService;

  LoginRepository(this._httpService);

  @override
  Future<bool> makeLogin(LoginModel loginModel) async {
    var response = await _httpService.get("login");
    return true;
  }

  @override
  Future<bool> makeLogout() async {
    return true;
  }
}
