import 'package:shared_preferences/shared_preferences.dart';

class SharePrefUtil {
  static SharePrefUtil? _instance;
  static SharePrefUtil getInstance()  {
     if(_instance == null) {
      _instance = SharePrefUtil();
      _instance!._initPref();
    }
    return _instance!;
  }

  static Future<void> init() async {
    if(_instance == null) {
      _instance = SharePrefUtil();
      _instance!._initPref();
    }
  }

  late SharedPreferences pref;

  Future<void> _initPref() async {
    SharedPreferences.getInstance().then((value) {
      pref = value;
      print("init pref ok");
    });
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