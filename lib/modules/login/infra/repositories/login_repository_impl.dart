import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/common/services/storage_service.dart';
import 'package:boticario_app/modules/login/domain/models/login_model.dart';
import 'package:boticario_app/modules/login/domain/repositories/login_repository.dart';

import '../../../app/constants.dart';

class LoginRepositoryImpl implements LoginRepository {
  final IHttpService _httpService;

  LoginRepositoryImpl(this._httpService);

  @override
  Future<LoginModel?> findUser(LoginModel loginModel) async {
    var response = await _httpService.get(
      "users?username=${loginModel.username}&password=${loginModel.password}",
    );
    if (response is List) {
      if (response.isEmpty) {
        return null;
      }
      response = response.first;
    }

    return LoginModel.fromJson(response);
  }

  @override
  Future<LoginModel?> getUserLogged() async {
    if (await StorageService.existsKey(loginKey)) {
      var data = await StorageService.getData(loginKey);
      return LoginModel.fromJson(data);
    }
    return null;
  }

  @override
  Future<bool> makeLogout() async {
    return await StorageService.dropKey(loginKey);
  }
}
