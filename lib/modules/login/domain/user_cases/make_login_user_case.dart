import 'package:boticario_app/common/services/security_service.dart';

import '../../infra/repositories/login_repository.dart';
import '../models/login_model.dart';

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
