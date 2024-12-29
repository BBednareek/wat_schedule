import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureItem extends Equatable {
  final String key;
  final String value;

  const SecureItem(this.key, this.value);

  @override
  List<Object> get props => [key, value];
}

@lazySingleton
class SecureStorageService {
  final _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  Future<Option<dynamic>> writeSecureData(SecureItem item) async {
    try {
      await _secureStorage.write(key: item.key, value: item.value);
      return none();
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> readSecureData(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } on PlatformException {
      await _secureStorage.deleteAll();
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteSecureData(String key) async =>
      await _secureStorage.delete(key: key);
}