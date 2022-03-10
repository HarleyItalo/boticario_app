import '../models/login_model.dart';
import '../repositories/login_repository.dart';

abstract class MakeLogout {
  Future<bool> call();
}

class MakeLogoutImpl extends MakeLogout {
  final LoginRepository _repository;
  MakeLogoutImpl(this._repository);

  @override
  Future<bool> call() async {
    return await _repository.makeLogout();
  }
}
