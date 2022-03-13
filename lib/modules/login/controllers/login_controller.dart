import 'package:boticario_app/common/controllers/base_controller.dart';
import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/modules/app/routes/routes.dart';
import 'package:boticario_app/modules/login/domain/errors/not_logged_exception.dart';
import 'package:boticario_app/modules/login/domain/user_cases/make_login.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  LoginController(this._makeLogin);
  final MakeLogin _makeLogin;

  var user = "".obs;
  var password = "".obs;

  setUser(String value) {
    user.value = value;
  }

  setPassword(String value) {
    password.value = value;
  }

  navigateToRegister() {
    NavigationService.pushNamed(Routes.register);
  }

  makeLogin() async {
    try {
      loadingState();
      var success =
          await _makeLogin(username: user.value, password: password.value);

      succeedState();

      return success;
    } on NotLoggedException {
      errorState();
      return false;
    }
  }

  @override
  init() {}
}
