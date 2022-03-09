import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/login/domain/models/login_model.dart';
import 'package:boticario_app/modules/login/domain/repositories/login_repository.dart';

class LoginRepository implements ILoginRepository {
  final IHttpService _httpService;

  LoginRepository(this._httpService);

  @override
  Future<LoginModel> makeLogin(LoginModel loginModel) async {
    var response = await _httpService.get(
      "users?username=${loginModel.username}&password=${loginModel.password}",
    );
    if (response is List) {
      response = response.first;
    }
    return LoginModel.fromJson(response);
  }

  @override
  Future<bool> makeLogout() async {
    return true;
  }
}
