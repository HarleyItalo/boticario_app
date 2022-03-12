import 'package:boticario_app/common/errors/request_error.dart';
import 'package:dio/dio.dart';

abstract class IHttpService {
  Future<dynamic> get(url);
  Future<Map<String, dynamic>> post(url, data);
  Future<Map<String, dynamic>> put(url, data);
  Future<bool> delete(url);

  Future<dynamic> getWithoutBaseUrl(url);
}

class DioHttpService implements IHttpService {
  DioHttpService(this._client, this.baseUrl);
  final String baseUrl;
  final Dio _client;

  @override
  Future<bool> delete(url) async {
    var response = await _client.delete("$baseUrl/$url");
    return response.statusCode == 200;
  }

  @override
  Future<dynamic> get(url) async {
    var response = await _client.get("$baseUrl/$url");
    if (response.statusCode != 200) {
      throw RequestError("Get without success");
    }
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post(url, data) async {
    var response = await _client.post("$baseUrl/$url", data: data);
    if (response.statusCode != 201) {
      throw RequestError("Post without success");
    }
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put(url, data) async {
    var response = await _client.put("$baseUrl/$url", data: data);
    if (response.statusCode != 200) {
      throw RequestError("Put without success");
    }
    return response.data;
  }

  @override
  Future getWithoutBaseUrl(url) async {
    var response = await _client.get(url);
    if (response.statusCode != 200) {
      throw RequestError("Get without success");
    }
    return response.data;
  }
}
