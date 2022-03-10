import 'package:boticario_app/common/validations/generic_validations.dart';

class ValidateConfimationPassword extends GenericValidations {
  String? call(String? value, String? password) {
    if (value != password) {
      return "As senhas não conferem, confira as senhas digitadas";
    }
    return null;
  }
}
