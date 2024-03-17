import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class HandleTokenRepo {
  Future<void> save(String value);
  Future<String> get();
  Future<void> delete();
}

class HandleToken extends HandleTokenRepo {
  final _secureStorage = const FlutterSecureStorage();
  static const _key = 'token';

  @override
  Future<String> get() async {
    return await _secureStorage.read(key: _key) ?? "";
  }

  @override
  Future<void> save(String value) async {
    await _secureStorage.write(key: _key, value: value);
  }

  @override
  Future<void> delete() async {
    await _secureStorage.deleteAll();
  }
}
