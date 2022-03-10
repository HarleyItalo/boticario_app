import 'package:boticario_app/common/models/reponse_model.dart';
import 'package:boticario_app/modules/register_user/domain/user_cases/register_user.dart';
import 'package:get/get.dart';
import '../../../common/controllers/base_controller.dart';
import '../domain/errors/user_name_in_use_exception.dart';

class RegisteUserController extends BaseController {
  final RegisterUser _registerUser;

  var user = "".obs;
  var name = "".obs;
  var password = "".obs;
  var confirmationPass = "".obs;
  var email = "".obs;

  RegisteUserController(this._registerUser);

  setUser(String value) {
    user.value = value;
  }

  setName(String value) {
    name.value = value;
  }

  setEmail(String value) {
    email.value = value;
  }

  setPassword(String value) {
    password.value = value;
  }

  setConfirmationPass(String value) {
    confirmationPass.value = value;
  }

  Future<ResponseModel> registerUser() async {
    try {
      loadingState();
      await _registerUser(
        email: email.value,
        nome: name.value,
        userName: user.value,
        password: password.value,
      );
      succeedState();
      return ResponseModel(
          true, "Cadastro concluido com sucesso, faça login para continuar!");
    } on UserNameInUseException {
      errorState();
      return ResponseModel(false, "Nome de usuário em uso!");
    }
  }

  void clear() {
    setEmail('');
    setName('');
    setPassword('');
    setUser('');
    setConfirmationPass('');
  }

  @override
  init() {}
}
