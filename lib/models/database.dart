import 'package:hive/hive.dart';

class LocalDataBase {
  /// to create an instance of the loclal DataBase with a specific box
  LocalDataBase(this._boxName);

  final String _boxName;

  /// If [defaultValue] is specified, it is returned in case the key does not
  /// exist.
  Future<T> getDataByKey<T>(String key, {T defaultValue}) async {
    try {
      final _box = await Hive.openBox(_boxName);
      final value = _box.get(key, defaultValue: defaultValue);
      // _box.close();
      return value;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> putDataIntoBox<T>(
    String key,
    T value,
  ) async {
    try {
      final _box = await Hive.openBox(_boxName);
      await _box.put(key, value);
      _box.close();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> removeDataFromBox<T>(String key) async {
    try {
      final _box = await Hive.openBox(_boxName);
      _box.delete(key);
      _box.close();
    } catch (e) {
      print(e.toString());
      return;
    }
  }

  Future<List<T>> getAllBoxData<T>() async {
    try {
      final _box = await Hive.openBox(_boxName);
      final value = _box.values.toList();
      _box.close();
      return value;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
