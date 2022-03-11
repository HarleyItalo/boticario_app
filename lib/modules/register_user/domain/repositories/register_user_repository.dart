import '../models/register_user_model.dart';

abstract class RegisterUserRepository {
  Future<UserModel> registerUser(UserModel userModel);
  Future<bool> userNameExists(String username);
  Future<bool> deleteUser(String id);
}
