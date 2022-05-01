import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences?> load() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  static void setString(String key, String value) {
    _prefs!.setString(key, value);
  }

  static void setInt(String key, int value) {
    _prefs!.setInt(key, value);
  }

  static void setDouble(String key, double value) {
    _prefs!.setDouble(key, value);
  }

  static void setBool(String key, bool value) {
    _prefs!.setBool(key, value);
  }

  static String getString(String key, {String? def}) {
    String? val;

    val = _prefs!.getString(key);

    val ??= def;

    return val!;
  }

  static int getInt(String key, int? def) {
    int? val;

    val = _prefs!.getInt(key);

    val ??= def;

    return val!;
  }

  static double getDouble(String key, {double? def}) {
    double? val;

    val = _prefs!.getDouble(key);

    val ??= def;

    return val!;
  }

  static bool getBool(String key, {bool def = false}) {
    bool? val;

    val = _prefs!.getBool(key);

    val ??= def;

    return val;
  }

  static dynamic getData({
    required String key,
  }) {
    return _prefs?.get(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await _prefs!.setString(key, value);
    if (value is int) return await _prefs!.setInt(key, value);
    if (value is bool) return await _prefs!.setBool(key, value);

    return await _prefs!.setDouble(key, value);
  }

  static Future<bool> removeData({required String key}) async {
    return await _prefs!.remove(key);
  }
}
