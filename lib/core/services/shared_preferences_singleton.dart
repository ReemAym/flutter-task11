import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSingleton {
  static late SharedPreferences _instance;

  // Private constructor
  SharedPreferencesSingleton._internal();

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static getBool(String key) {
    return _instance.getBool(key) ?? false;
  }
}
