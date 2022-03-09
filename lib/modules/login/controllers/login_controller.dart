import 'package:boticario_app/common/controllers/base_controller.dart';
import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  var user = "".obs;
  var password = "".obs;

  setUser(String value) {
    user.value = value;
  }

  setPassword(String value) {
    password.value = value;
  }

  navigateToRegister() {
    NavigationService.pushNamed('');
  }

  @override
  init() {}
}
