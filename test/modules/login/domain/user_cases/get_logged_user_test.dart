import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/app/constants.dart';
import 'package:boticario_app/modules/login/domain/errors/not_logged_exception.dart';
import 'package:boticario_app/modules/login/domain/user_cases/get_user_logged.dart';
import 'package:boticario_app/modules/login/domain/user_cases/make_login_user_case.dart';
import 'package:boticario_app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final dioClient = Dio();
  final dioMock = DioHttpService(dioClient, urlApi);
  final _repository = LoginRepositoryImpl(dioMock);
  final getUserLogged = GetUserLoggedImpl(_repository);
  test("deve falhar ao buscar o usuario logado", () async {
    SharedPreferences.setMockInitialValues({});
    try {
      await getUserLogged();
    } on NotLoggedException catch (exeption) {
      expect(exeption, isA<NotLoggedException>());
    }
  });

  test("deve fazer login", () async {
    Map<String, Object> data = {
      loginKey:
          '{"username":"harleyitalo","password":"1aa156818133c840305b43fb910acef81b1861c55936419f14c08b92c66bbf51","nome":"harley","email":"harleyitalo@hotmail.com","profile_picture":"http://placeimg.com/640/480/cats","id":"2"}'
    };
    SharedPreferences.setMockInitialValues(data);
    var user = await getUserLogged();
    expect(user?.username == 'harleyitalo', true);
  });
}
