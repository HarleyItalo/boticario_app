import 'package:boticario_app/common/services/security_service.dart';

import 'package:boticario_app/modules/register_user/domain/errors/user_name_in_use_exception.dart';
import 'package:boticario_app/modules/register_user/domain/models/register_user_model.dart';
import 'package:boticario_app/modules/register_user/domain/repositories/register_user_repository.dart';

abstract class RegisterUser {
  Future<String?> call(
      {required String email,
      required String nome,
      required String password,
      required String userName});
}

class RegisterUserImpl extends RegisterUser {
  final RegisterUserRepository _repository;
  RegisterUserImpl(this._repository);

  @override
  Future<String?> call(
      {required String email,
      required String nome,
      required String password,
      required String userName}) async {
    if (await _repository.userNameExists(userName)) {
      throw UserNameInUseException();
    }

    var model = UserModel(
        email: email,
        nome: nome,
        password: SecurityService.encript(password),
        username: userName);

    var response = await _repository.registerUser(model);
    return response.id;
  }
}
