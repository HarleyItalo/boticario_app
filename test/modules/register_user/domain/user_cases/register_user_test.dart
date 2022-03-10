import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/register_user/domain/errors/user_name_in_use_exception.dart';
import 'package:boticario_app/modules/register_user/domain/user_cases/register_user.dart';
import 'package:boticario_app/modules/register_user/infra/repositories/register_user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dioClient = Dio();
  final dioMock =
      DioHttpService(dioClient, "https://622925e0be12fc4538979da3.mockapi.io/");
  final repository = RegisterUserRepositoryImpl(dioMock);
  final userCase = RegisterUserImpl(repository);
  test("deve falhar ao cadastrar o usuario ", () {
    try {
      userCase(email: 'a', nome: 'h', userName: 'harley', password: '123');
      userCase(email: 'a', nome: 'h', userName: 'harley', password: '123');
    } on UserNameInUseException catch (e) {
      expect(e, isA<UserNameInUseException>());
    }
  });
  test('deve registrar um novo usuario', () async {
    var response = await userCase(
        email: 'a', nome: 'h', userName: 'jonas', password: '123');
    expect(response != null, true);
    repository.deleteUser(response!);
  });
}
