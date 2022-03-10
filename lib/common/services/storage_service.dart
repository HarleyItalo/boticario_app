import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<bool> setData(String key, value,
      {bool serialize = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (serialize) {
      value = jsonEncode(value);
    }
    return await prefs.setString(key, value);
  }

  static Future<Map<String, dynamic>> getData(key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var result = prefs.getString(key);
      if (result == null) throw Exception();

      return jsonDecode(result);
    } catch (e) {
      return <String, dynamic>{};
    }
  }

  static Future<bool> existsKey(key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.containsKey(key);
    } catch (e) {
      return false;
    }
  }
}
