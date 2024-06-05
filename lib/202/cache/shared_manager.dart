import 'package:flutter_learn/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys {
  counter,
  users,
}

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  void _checkPrefences() {
    if (preferences == null) throw Exception(SharedNotInitializeException());
  }

  Future<void> init() async {
    // Obtain shared preferences.
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPrefences();
    // Save an integer value to 'counter' key.
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPrefences();
    // Save an integer value to 'counter' key.
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStringItems(SharedKeys key) {
    _checkPrefences();
    // Try reading data from the 'counter' key. If it doesn't exist, returns null.
    return preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    _checkPrefences();
    // Try reading data from the 'counter' key. If it doesn't exist, returns null.
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPrefences();
    // Remove data for the 'counter' key.
    return await preferences?.remove(key.name) ?? false;
  }
}
