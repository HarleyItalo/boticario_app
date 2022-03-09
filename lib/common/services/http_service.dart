import 'package:boticario_app/common/errors/request_error.dart';
import 'package:dio/dio.dart';

abstract class IHttpService {
  Future<Map<String, dynamic>> get(url);
  Future<Map<String, dynamic>> post(url);
  Future<Map<String, dynamic>> put(url);
  Future<Map<String, dynamic>> delete(url);
}

class DioHttpService implements IHttpService {
  DioHttpService(this._client, this.baseUrl);
  final String baseUrl;
  final Dio _client;

  @override
  Future<Map<String, dynamic>> delete(url) async {
    var response = await _client.delete("$baseUrl/$url");
    if (response.statusCode != 200) {
      throw RequestError("Delete without success");
    }
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> get(url) async {
    var callUrl = "$baseUrl/$url";
    var response = await _client.get(callUrl);
    print(response.data);
    if (response.statusCode != 200) {
      throw RequestError("Get without success");
    }
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post(url) async {
    var response = await _client.post("$baseUrl/$url.json");
    if (response.statusCode != 201) {
      throw RequestError("Post without success");
    }
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put(url) async {
    var response = await _client.post("$baseUrl/$url.json");
    if (response.statusCode != 201) {
      throw RequestError("Put without success");
    }
    return response.data;
  }
}
