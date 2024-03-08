import 'package:shared_preferences/shared_preferences.dart';

// this sharedPreference only store string values
class SharedPre {
  static Future<bool> setItem(String key, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(key, value);
  }

  static Future<String?> getItem(String key) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getString(key);
    } catch (e) {
      return '';
    }
  }

  static Future<bool> removeItem(String key) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.remove(key);
    } catch (e) {
      return false;
    }
  }
}
