import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/login/domain/errors/not_logged_exception.dart';
import 'package:boticario_app/modules/login/domain/user_cases/make_login_user_case.dart';
import 'package:boticario_app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dioClient = Dio();
  final dioMock =
      DioHttpService(dioClient, "https://622925e0be12fc4538979da3.mockapi.io/");
  final _repository = LoginRepositoryImpl(dioMock);
  final makeLogin = MakeLoginImpl(_repository);
  test("deve falhar ao fazer login", () async {
    try {
      await makeLogin(password: '123', username: '81998012983');
    } on NotLoggedException catch (exeption) {
      expect(exeption, isA<NotLoggedException>());
    }
  });
}
