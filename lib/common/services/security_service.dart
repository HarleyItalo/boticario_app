import 'dart:convert';
import 'package:boticario_app/modules/app/constants.dart';
import 'package:crypto/crypto.dart';

class SecurityService {
  static String encript(String textPlain) {
    var key = utf8.encode(secureKey);
    var bytes = utf8.encode(textPlain);
    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);
    return digest.toString();
  }
}
