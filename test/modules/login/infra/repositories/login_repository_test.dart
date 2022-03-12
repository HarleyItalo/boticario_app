import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/app/constants.dart';
import 'package:boticario_app/modules/login/domain/models/login_model.dart';
import 'package:boticario_app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dioClient = Dio();
  var dioMock = DioHttpService(dioClient, urlApi);
  LoginRepositoryImpl repository = LoginRepositoryImpl(dioMock);

  test("Deve falhar ao buscar o usuario com os dados enviados", () async {
    var response = await repository
        .findUser(LoginModel(username: 'kljjaklkakjlakl', password: '123'));

    expect(response, null);
  });

  test("Deve buscar o usuario", () async {
    var response = await repository.findUser(
      LoginModel(
        username: 'harley',
        password: '123',
      ),
    );
    expect(response?.username, 'harley');
  });
}
