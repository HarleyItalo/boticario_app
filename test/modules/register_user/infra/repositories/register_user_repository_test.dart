import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/app/constants.dart';
import 'package:boticario_app/modules/register_user/domain/models/register_user_model.dart';
import 'package:boticario_app/modules/register_user/infra/repositories/register_user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dioClient = Dio();
  final dioMock = DioHttpService(dioClient, urlApi);
  final repository = RegisterUserRepositoryImpl(dioMock);
  test("Deve registrar e deletar um novo usuario", () async {
    var response = await repository.registerUser(UserModel(
        username: 'harley', nome: 'harley', email: 'harleyitalo@hotmail.com'));
    expect(response.username == 'harley', true);
    expect(await repository.deleteUser(response.id!), true);
  });

  test("deve encontrar um usuario com esse nome", () async {
    var response = await repository.userNameExists('harley');
    expect(response, true);
  });
  test("Não deve encontar um usuario com ess nome", () async {
    var response = await repository.userNameExists('klajsldkajslkdjaslkd');
    expect(response, true);
  });
}
