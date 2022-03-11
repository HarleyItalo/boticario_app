import 'package:boticario_app/modules/register_user/domain/models/register_user_model.dart';

import '../models/login_model.dart';
import '../repositories/login_repository.dart';

abstract class GetUserLogged {
  Future<UserModel?> call();
}

class GetUserLoggedImpl extends GetUserLogged {
  final LoginRepository _repository;
  GetUserLoggedImpl(this._repository);

  @override
  Future<UserModel?> call() async {
    return await _repository.getUserLogged();
  }
}
