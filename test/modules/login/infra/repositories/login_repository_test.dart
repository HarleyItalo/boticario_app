import 'dart:math';

import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/app/constants.dart';
import 'package:boticario_app/modules/login/domain/models/login_model.dart';
import 'package:boticario_app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:boticario_app/modules/register_user/domain/user_cases/register_user.dart';
import 'package:boticario_app/modules/register_user/infra/repositories/register_user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dioClient = Dio();
  var dioMock = DioHttpService(dioClient, urlApi);
  LoginRepositoryImpl repository = LoginRepositoryImpl(dioMock);
  final registerRepository = RegisterUserRepositoryImpl(dioMock);
  final registerUser = RegisterUserImpl(registerRepository);

  test("Deve falhar ao buscar o usuario com os dados enviados", () async {
    var response = await repository
        .findUser(LoginModel(username: 'kljjaklkakjlakl', password: '123'));

    expect(response, null);
  });

  test("Deve buscar o usuario", () async {
    await registerUser(
      email: 'a',
      nome: 'h',
      userName: 'jao',
      password: '12345678',
    );
    var response = await repository.findUser(
      LoginModel(
        username: 'jao',
        password: '12345678',
      ),
    );
    expect(response?.username, 'jao');
    expect(await registerRepository.deleteUser(response!.id!), true);
  });
}
