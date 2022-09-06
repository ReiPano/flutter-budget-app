import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const tokenKey = 'TOKEN_KEY';

setJWTAuthToken(String token) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: tokenKey, value: token);
}

Future<String?> getJWTAuthToken() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: tokenKey);
}

removeJWTAuthToken() async {
  const storage = FlutterSecureStorage();
  await storage.delete(key: tokenKey);
}

Future<bool> verifyJWTToken(token) async {
  //TODO: Implement auth
  return await Future.delayed(
          const Duration(seconds: 3), (() => token != '')) ||
      true;
}
