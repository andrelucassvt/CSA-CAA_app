import 'package:projeto_csa_app/app/shared/database/save_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveKeysImpl implements SaveKeys {

  @override
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getString('token-user');
    if (result != null) {
      return result;
    }
    return "Invalid";
  }

  @override
  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token-user', token);
  }
  
}