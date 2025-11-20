
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveManager {
  static bool _initialized = false;

  static Future<void> init() async {
    if(!_initialized){
      await Hive.initFlutter();
      _initialized = true;
    }
  }

  static Future<Box<T>> openBox<T>(String name) async{
    return await Hive.openBox<T>(name);
  }

  static Future<void> closeBox(String name) async{
    return await Hive.box(name).close();
  }
}