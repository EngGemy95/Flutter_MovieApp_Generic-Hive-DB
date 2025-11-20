import 'package:hive/hive.dart';

abstract class BaseLocalRepository<T> {
  final String boxName;

  BaseLocalRepository(this.boxName);

  Future<void> addItem(String key, T item) async {
    final box = await Hive.openBox<T>(boxName);
    await box.put(key, item);
  }

  Future<T?> getItem(String key) async {
    final box = await Hive.openBox<T>(boxName);
    return box.get(key);
  }

  Future<List<T>> getAll() async {
    final box = await Hive.openBox<T>(boxName);
    return box.values.toList();
  }

  Future<void> deleteItem(String key) async {
    final box = await Hive.openBox<T>(boxName);
    await box.delete(key);
  }

  Future<void> clear() async {
    final box = await Hive.openBox<T>(boxName);
    await box.clear();
  }
}
