import 'package:boticario_app/common/services/security_service.dart';
import 'package:boticario_app/common/services/storage_service.dart';
import 'package:boticario_app/modules/login/domain/errors/not_logged_exception.dart';

import '../models/login_model.dart';
import '../repositories/login_repository.dart';

abstract class CheckIfIsLogged {
  Future<LoginModel?> call();
}

class CheckIfIsLoggedImpl extends CheckIfIsLogged {
  final LoginRepository _repository;
  CheckIfIsLoggedImpl(this._repository);

  @override
  Future<LoginModel?> call() async {
    return await _repository.getUserLogged();
  }
}
