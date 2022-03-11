import 'package:boticario_app/common/validations/validation_compare.dart';
import '../../../../common/validations/validation_compare.dart';

class ValidateConfimationPassword extends ValidationCompare {
  @override
  String? compare(String? value, String? value2) {
    if (value != value2) {
      return "As senhas não conferem, confira as senhas digitadas";
    }
    return null;
  }
}
