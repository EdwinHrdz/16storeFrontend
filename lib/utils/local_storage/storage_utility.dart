import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal();

  final _storage = GetStorage();

  // Metodo generico para Almacener Data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Metodo generico para Leer Data
  T? readData<T>(String key) {
    return _storage.read(key);
  }

  // Metodo generico para Remover Data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Metodo generico para Limpiar Data
  Future<void> clearAll() async {
    await _storage.erase();
  }
}