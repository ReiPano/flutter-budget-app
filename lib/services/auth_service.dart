import 'dart:async';
import 'package:budget/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const tokenKey = 'TOKEN_KEY';

void setJWTAuthToken(String token) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: tokenKey, value: token);
}

Future<String?> getJWTAuthToken() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: tokenKey);
}

void removeJWTAuthToken() async {
  const storage = FlutterSecureStorage();
  await storage.delete(key: tokenKey);
}

Future<bool> verifyJWTToken(token) async {
  //TODO: Implement auth
  return await Future.delayed(const Duration(seconds: 3), (() => token != ''));
}

Future<bool> loginWithUsernameAndPassword(String username, String password) {
  // TDOD: Implement real login
  setJWTAuthToken('1234');
  return Future.delayed(const Duration(seconds: 1), () => false);
}

Future<bool> registerNewUser(User user) {
  // TDOD: Implement real signup
  setJWTAuthToken('1234');
  return Future.delayed(const Duration(seconds: 1), () => false);
}
