import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';

class RegisteUserController extends BaseController {
  var user = "".obs;
  var password = "".obs;
  var confirmationPass = "".obs;

  setUser(String value) {
    user.value = value;
  }

  setPassword(String value) {
    password.value = value;
  }

  setConfirmationPass(String value) {
    confirmationPass.value = value;
  }

  registerUser() {}

  @override
  init() {}
}
