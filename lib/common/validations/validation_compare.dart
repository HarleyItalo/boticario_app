import 'package:boticario_app/common/validations/generic_validations.dart';

abstract class ValidationCompare extends GenericValidations {
  String? compare(String? value, String? value2);
}
