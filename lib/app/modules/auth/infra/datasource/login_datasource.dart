abstract class LoginDatasource {
  Future<void> loginPaciente(String cpf);
  Future<void> loginMedico({required String email, required String senha});
}