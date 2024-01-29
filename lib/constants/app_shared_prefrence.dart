import 'package:shared_preferences/shared_preferences.dart';

enum AppSharedPrefEnums {
  email,
  password,
  loginStatus,
  fullName,
  dob,
  gender,
  profileImage
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

  void remove(AppSharedPrefEnums key) {
    pref?.remove(key.name);
  }

  void clear() async {
    pref?.clear();
  }
}
