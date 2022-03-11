import '../../../../common/validations/generic_validations.dart';

class ValidatePost extends GenericValidations {
  @override
  String? call(String? value) {
    if (isNullOrEmpty(value, minLenght: 5)) {
      return "Seu post deve ter no minimo 5 caracteres, e no maximo 280";
    }
    return null;
  }
}
