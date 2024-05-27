import 'package:core/enum/cache/cache_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  CacheManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static final CacheManager _instance = CacheManager._init();

  SharedPreferences? _preferences;
  static CacheManager get instance => _instance;
  static Future<void> preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> setStringValue(CacheKeys key, String value) async {
    await _preferences!.setString(key.name, value);
  }

  Future<void> setBoolValue(CacheKeys key, bool value) async {
    await _preferences!.setBool(key.name, value);
  }

  Future<void> setDoubleValue(CacheKeys key, double value) async {
    await _preferences!.setDouble(key.name, value);
  }

  Future<void> removeValue(CacheKeys value) async {
    await _preferences!.remove(value.name);
  }

  String? getStringValue(String key) => _preferences?.getString(key);

  bool? getBoolValue(String key) => _preferences!.getBool(key);

  double? getDoubleValue(String key) => _preferences!.getDouble(key);
}
