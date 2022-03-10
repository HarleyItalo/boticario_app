import 'dart:ffi';

import '../models/register_user_model.dart';

abstract class RegisterUserRepository {
  Future<RegisterUserModel> registerUser(RegisterUserModel userModel);
  Future<bool> userNameExists(String username);
  Future<bool> deleteUser(String id);
}
