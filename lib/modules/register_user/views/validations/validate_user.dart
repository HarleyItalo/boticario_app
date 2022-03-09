import 'package:boticario_app/common/validations/generic_validations.dart';

class ValidateUser extends GenericValidations {
  String? call(String? value) {
    if (isNullOrEmpty(value, minLenght: 2)) {
      return "Digite seu nome.";
    }
    return null;
  }
}
