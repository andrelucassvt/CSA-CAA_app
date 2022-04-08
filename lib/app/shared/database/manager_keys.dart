abstract class ManagerKeys {
  Future<void> saveToken(String token);
  Future<String> getToken();
  Future<void> saveInfoUser(String data);
  Future<String> getInfoUser();
  Future<void> saveAcesso();
  Future<bool> getPrimeiroAcesso();
} 