import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/register_user/domain/models/register_user_model.dart';

import '../../domain/repositories/register_user_repository.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  RegisterUserRepositoryImpl(this._httpService);
  final IHttpService _httpService;
  @override
  Future<UserModel> registerUser(UserModel userModel) async {
    var result = await _httpService.post('users', userModel);
    return UserModel.fromJson(result);
  }

  @override
  Future<bool> userNameExists(String username) async {
    var response = await _httpService.get('users?username=$username');
    return response is List && response.isNotEmpty;
  }

  @override
  Future<bool> deleteUser(String id) async {
    var response = await _httpService.delete('users/$id');
    return response;
  }
}
