import 'package:boticario_app/common/services/http_service.dart';
import 'package:boticario_app/modules/login/domain/models/login_model.dart';
import 'package:boticario_app/modules/login/infra/repositories/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../mocks/dio_mock.dart';

void main() {
  final dioClient = DioMock();
  var dioMock = DioHttpService(dioClient, "");
  LoginRepository repository = LoginRepository(dioMock);

  test("Deve fazer Login com os dados enviados", () async {
    when(dioMock.get("login")).thenAnswer((_) async => <String, dynamic>{});
    when(dioClient.get("login")).thenAnswer((_) async {
      return Future(
        () => Response(
          statusCode: 200,
          data: <String, dynamic>{},
          requestOptions: RequestOptions(path: ''),
        ),
      );
    });

    var response = await repository
        .makeLogin(LoginModel(username: 'harley', password: '123'));
    assert(response, true);
  });
}
