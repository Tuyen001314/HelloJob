import 'package:shared_preferences/shared_preferences.dart';

class SharePrefUtil {
  static SharePrefUtil? _instance;

  static SharePrefUtil getInstance() {
    _instance ??= SharePrefUtil();
    return _instance!;
  }

  SharePrefUtil() {
    initPref();
  }

  late SharedPreferences pref;

  Future<void> initPref() async {
    await SharedPreferences.getInstance().then((value) => pref = value);
  }

  String? _saveUserName;

  String? get saveUserName {
    _saveUserName ??= pref.getString("user_name");
    return _saveUserName;
  }

  void setSaveUserName(String value) async {
    _saveUserName = value;
    await pref.setString("user_name", value);
  }

  String? _savePassword;

  String? get savePassword {
    _savePassword ??= pref.getString("password");
    return _savePassword;
  }

  void setSavePassword(String value) async {
    _savePassword = value;
    await pref.setString("password", value);
  }
}