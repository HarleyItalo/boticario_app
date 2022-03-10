import 'package:boticario_app/common/services/security_service.dart';
import 'package:boticario_app/modules/login/domain/errors/not_logged_exception.dart';

import '../models/login_model.dart';
import '../repositories/login_repository.dart';

abstract class MakeLogin {
  Future<bool> call({
    required String username,
    required String password,
  });
}

class MakeLoginImpl extends MakeLogin {
  final LoginRepository _repository;
  MakeLoginImpl(this._repository);

  @override
  Future<bool> call(
      {required String username, required String password}) async {
    var response = await _repository.findUser(
      LoginModel(
        username: username,
        password: SecurityService.encript(password),
      ),
    );
    if (response?.username == username &&
        response?.password == SecurityService.encript(password)) {
      return true;
    }
    throw NotLoggedException();
  }
}
