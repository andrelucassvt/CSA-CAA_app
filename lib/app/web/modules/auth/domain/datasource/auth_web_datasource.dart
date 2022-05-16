abstract class AuthWebDatasource {
  Future<void> login({required String email, required String senha});
}