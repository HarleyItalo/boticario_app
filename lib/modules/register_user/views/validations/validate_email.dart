import 'package:boticario_app/common/validations/generic_validations.dart';

class ValidadeEmail extends GenericValidations {
  @override
  String? call(String? value) {
    if (!emailIsValid(value)) {
      return "Digite seu usuário, e confirme que ele tem mais de 5 caracteres ";
    }
    return null;
  }
}
