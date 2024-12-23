import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _preferences;

  // Initialize the SharedPreferences instance
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save data to SharedPreferences
  static Future<bool> saveData(String key, dynamic value) async {
    if (value is String) {
      return await _preferences!.setString(key, value);
    } else if (value is int) {
      return await _preferences!.setInt(key, value);
    } else if (value is bool) {
      return await _preferences!.setBool(key, value);
    } else if (value is double) {
      return await _preferences!.setDouble(key, value);
    } else if (value is List<String>) {
      return await _preferences!.setStringList(key, value);
    } else {
      return await _preferences!.setString(key, json.encode(value));
    }
  }

  // Retrieve data from SharedPreferences
  static dynamic getData(String key) {
    if (_preferences!.containsKey(key)) {
      return _preferences!.get(key);
    }
    return null;
  }

  // Retrieve data as a specific type
  static T? getTypedData<T>(String key) {
    if (_preferences!.containsKey(key)) {
      final data = _preferences!.get(key);
      if (data is T) {
        return data;
      } else if (T == Map || T == List) {
        return json.decode(data as String) as T;
      }
    }
    return null;
  }

  // Delete a specific key
  static Future<bool> deleteData(String key) async {
    return await _preferences!.remove(key);
  }

  // Clear all SharedPreferences data
  static Future<bool> clearAll() async {
    return await _preferences!.clear();
  }

  // Check if a key exists
  static bool containsKey(String key) {
    return _preferences!.containsKey(key);
  }
}

// Usage example
// Ensure to call CacheHelper.init() before using the helper
/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  // Save data
  await CacheHelper.saveData('username', 'JohnDoe');

  // Retrieve data
  String? username = CacheHelper.getTypedData<String>('username');
  print('Username: $username');

  // Delete data
  await CacheHelper.deleteData('username');

  // Clear all data
  await CacheHelper.clearAll();
}
*/
