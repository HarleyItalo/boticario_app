import 'package:boticario_app/common/validations/generic_validations.dart';

class PasswordValidation extends GenericValidations {
  String? call(String? value) {
    if (isNullOrEmpty(value, minLenght: 5)) {
      return "Digite sua senha, e confirme que ela tem mais de 8 caracteres";
    }
    return null;
  }
}
