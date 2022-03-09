import 'package:boticario_app/common/validations/generic_validations.dart';

class UsernameValidation extends GenericValidations {
  String? call(String? value) {
    if (isNullOrEmpty(value, minLenght: 5)) {
      return "Digite seu usuário, e confirme que ele tem mais de 5 caracteres ";
    }
    return null;
  }
}
