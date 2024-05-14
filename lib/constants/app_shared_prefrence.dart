import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum AppSharedPrefEnums {
  email,
  password,
  loginStatus,
  fullName,
  dob,
  gender,
  profileImage,
  lastActive,
  onBoardingShown,
  timeStamp,
  favouriteList
}

class AppSharedPref {
  SharedPreferences? pref;
  AppSharedPref() {
    _setup();
  }

  _setup() async {
    pref = await SharedPreferences.getInstance();
  }

  setString({required AppSharedPrefEnums key, required String value}) {
    pref?.setString(key.name, value);
  }

  String getString({required AppSharedPrefEnums key}) {
    return pref?.getString(key.name) ?? "";
  }

  setBool({required AppSharedPrefEnums key, required bool value}) {
    pref?.setBool(key.name, value);
  }

  bool getBool({required AppSharedPrefEnums key}) {
    return pref?.getBool(key.name) ?? false;
  }

  setInt({required AppSharedPrefEnums key, required int value}) {
    pref?.setInt(key.name, value);
  }

  int getInt({required AppSharedPrefEnums key}) {
    return pref?.getInt(key.name) ?? 0;
  }

  void remove(AppSharedPrefEnums key) {
    pref?.remove(key.name);
  }

  void clear() async {
    pref?.clear();
  }

  // Save and retrieve a list of JSON using a model
  List<T> getList<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final jsonStringList = pref?.getStringList(key);
    if (jsonStringList != null) {
      return jsonStringList.map((jsonString) {
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        return fromJson(jsonMap);
      }).toList();
    }
    return [];
  }

  Future<bool> saveList(String key, List<dynamic> list) async {
    final jsonStringList = list.map((item) => json.encode(item)).toList();
    return await pref?.setStringList(key, jsonStringList) ?? false;
  }

  // Remove a list from SharedPreferences
  Future<void> removeList(String key) async {
    await pref?.remove(key);
  }

  static Future<bool> saveSingleString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<String?> getSingleString(String? key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key!);
  }

  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
