import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static bool _darkmode = false;
  static bool _isChecked = false;
  static String _email = '';
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get darkmode {
    return _prefs.getBool('darkmode') ?? _darkmode;
  }

  static set darkmode(bool value) {
    _darkmode = value;
    _prefs.setBool('darkmode', value);
  }

  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static set email(String value){
    _email = value;
    _prefs.setString('email', value);
  }

  static bool get isChecked {
    return _prefs.getBool('isChecked') ?? _isChecked;
  }

  static set isChecked(bool value){
    _isChecked = value;
    _prefs.setBool('isChecked', value);
  }
}