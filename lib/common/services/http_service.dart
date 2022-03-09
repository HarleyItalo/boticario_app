import 'package:boticario_app/common/errors/request_error.dart';
import 'package:dio/dio.dart';

abstract class IHttpService {
  Future<Map<String, dynamic>> get(url);
  Future<Map<String, dynamic>> post(url);
  Future<Map<String, dynamic>> put(url);
  Future<Map<String, dynamic>> delete(url);
}

class DioHttpService implements IHttpService {
  DioHttpService(this._client);

  final Dio _client;

  @override
  Future<Map<String, dynamic>> delete(url) async {
    var response = await _client.delete(url);
    if (response.statusCode != 200) {
      throw RequestError("Delete without success");
    }
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> get(url) async {
    var response = await _client.get(url);
    if (response.statusCode != 200) {
      throw RequestError("Get without success");
    }
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post(url) async {
    var response = await _client.post(url);
    if (response.statusCode != 201) {
      throw RequestError("Post without success");
    }
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put(url) async {
    var response = await _client.post(url);
    if (response.statusCode != 201) {
      throw RequestError("Put without success");
    }
    return response.data;
  }
}
