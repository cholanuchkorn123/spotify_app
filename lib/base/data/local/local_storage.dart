import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class HandleTokenRepo with UserIdRepo {
  Future<void> saveToken(String value);
  Future<void> saveRefreshToken(String value);
  Future<String> getToken();
  Future<String> getRefreshToken();
  Future<void> delete();
}

mixin UserIdRepo {
  Future<String> getUserID();
  Future<void> saveUserId(String value);
}

class HandleToken extends HandleTokenRepo {
  final _secureStorage = const FlutterSecureStorage();
  static const _key = 'token';
  static const _refreshKey = 'refreshtoken';
  static const _userIdKey = 'userId';

  @override
  Future<String> getToken() async {
    return await _secureStorage.read(key: _key) ?? "";
  }

  @override
  Future<void> saveToken(String value) async {
    await _secureStorage.delete(key: _key);
    await _secureStorage.write(key: _key, value: value);
  }

  @override
  Future<void> delete() async {
    await _secureStorage.deleteAll();
  }

  @override
  Future<void> saveRefreshToken(String value) async {
    await _secureStorage.delete(key: _refreshKey);

    await _secureStorage.write(key: _refreshKey, value: value);
  }

  @override
  Future<String> getRefreshToken() async {
    return await _secureStorage.read(key: _refreshKey) ?? "";
  }

  @override
  Future<String> getUserID() async {
    return await _secureStorage.read(key: _userIdKey) ?? "";
  }

  @override
  Future<void> saveUserId(String value) async {
    await _secureStorage.write(key: _userIdKey, value: value);
  }
}
