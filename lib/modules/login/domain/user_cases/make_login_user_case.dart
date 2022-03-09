import 'package:boticario_app/common/services/security_service.dart';

import '../models/login_model.dart';
import '../repositories/login_repository.dart';

abstract class MakeLogin {
  Future<LoginModel> call({
    required String username,
    required String password,
  });
}

class MakeLoginImpl extends MakeLogin {
  final LoginRepository _repository;
  MakeLoginImpl(this._repository);

  @override
  Future<LoginModel> call(
      {required String username, required String password}) async {
    return await _repository.makeLogin(
      LoginModel(
        username: username,
        password: SecurityService.encript(password),
      ),
    );
  }
}
