import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/app/constants.dart';
import 'package:boticario_app/modules/register_user/domain/errors/user_name_in_use_exception.dart';
import 'package:boticario_app/modules/register_user/domain/user_cases/register_user.dart';
import 'package:boticario_app/modules/register_user/infra/repositories/register_user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dioClient = Dio();
  final dioMock = DioHttpService(dioClient, urlApi);
  final repository = RegisterUserRepositoryImpl(dioMock);
  final userCase = RegisterUserImpl(repository);
  test("deve falhar ao cadastrar o usuario ", () async {
    try {
      var user = await userCase(
        email: 'a',
        nome: 'h',
        userName: 'harley',
        password: '123',
      );

      var user1 = await userCase(
        email: 'a',
        nome: 'h',
        userName: 'harley',
        password: '123',
      );

      expect(await repository.deleteUser(user!), true);
      expect(await repository.deleteUser(user1!), true);
    } on UserNameInUseException catch (e) {
      expect(e, isA<UserNameInUseException>());
    }
  });
  test('deve registrar um novo usuario', () async {
    var response = await userCase(
      email: 'a',
      nome: 'h',
      userName: 'jonas',
      password: '123',
    );
    expect(await repository.deleteUser(response!), true);
    expect(response.isNotEmpty, true);
  });
}
