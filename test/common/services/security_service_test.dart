import 'package:boticario_app/common/services/security_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("testar a criptografia", () {
    var response = SecurityService.encript("harley");
    expect(response, isA<String>());
  });
  test("deve gerar duas chaves iguais", () {
    var primeiraCripto = SecurityService.encript("harley");
    var segundaCripto = SecurityService.encript("harley");
    expect(primeiraCripto == segundaCripto, true);
  });
  test("deve gerar duas chaves diferentes", () {
    var primeiraCripto = SecurityService.encript("harley");
    var segundaCripto = SecurityService.encript("harley1");
    expect(primeiraCripto != segundaCripto, true);
  });
}
