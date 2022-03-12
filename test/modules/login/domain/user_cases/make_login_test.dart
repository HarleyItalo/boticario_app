import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/app/constants.dart';
import 'package:boticario_app/modules/login/domain/errors/not_logged_exception.dart';
import 'package:boticario_app/modules/login/domain/user_cases/make_login_user_case.dart';
import 'package:boticario_app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:boticario_app/modules/register_user/domain/user_cases/register_user.dart';
import 'package:boticario_app/modules/register_user/infra/repositories/register_user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final dioClient = Dio();
  final dioMock = DioHttpService(dioClient, urlApi);
  final _repository = LoginRepositoryImpl(dioMock);
  final makeLogin = MakeLoginImpl(_repository);
  final registerRepository = RegisterUserRepositoryImpl(dioMock);
  final registerUser = RegisterUserImpl(registerRepository);
  test("deve falhar ao fazer login", () async {
    try {
      await makeLogin(password: '123', username: '81998012983');
    } on NotLoggedException catch (exeption) {
      expect(exeption, isA<NotLoggedException>());
    }
  });

  test("deve fazer login", () async {
    SharedPreferences.setMockInitialValues({});
    var user = await registerUser(
      email: 'a',
      nome: 'h',
      userName: 'harleyitalo',
      password: '12345678',
    );
    var response =
        await makeLogin(password: '12345678', username: 'harleyitalo');
    expect(await registerRepository.deleteUser(user!), true);
    expect(response, true);
  });
}
