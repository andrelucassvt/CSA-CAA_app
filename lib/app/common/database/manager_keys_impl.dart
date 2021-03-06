import 'package:projeto_csa_app/app/common/database/manager_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManagerKeysImpl implements ManagerKeys {

  @override
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getString('token-user');
    if (result != null) {
      return result;
    }
    return "";
  }

  @override
  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token-user', token);
  }

  @override
  Future<String> getInfoUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getString('info-user');
    if (result != null) {
      return result;
    }
    return "";
  }

  @override
  Future<void> saveInfoUser(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('info-user', data);
  }
}