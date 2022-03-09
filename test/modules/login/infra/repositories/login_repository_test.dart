import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/login/domain/models/login_model.dart';
import 'package:boticario_app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dioClient = Dio();
  var dioMock =
      DioHttpService(dioClient, "https://622925e0be12fc4538979da3.mockapi.io/");
  LoginRepositoryImpl repository = LoginRepositoryImpl(dioMock);

  test("Deve falhar ao fazer login com os dados enviados", () async {
    var response = await repository
        .findUser(LoginModel(username: 'kljjaklkakjlakl', password: '123'));

    expect(response, null);
  });

  test("Deve buscar o usuario", () async {
    var response = await repository
        .findUser(LoginModel(username: 'harley', password: '123'));
    expect(response?.username, 'harley');
  });
}
