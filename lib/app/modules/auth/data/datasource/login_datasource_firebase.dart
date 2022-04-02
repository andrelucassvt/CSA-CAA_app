import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/datasource/login_datasource.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/error/senha_errada_error.dart';
import 'package:projeto_csa_app/app/shared/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/shared/interceptors/dio_builder.dart';

class LoginDataSourceFirebase implements LoginDatasource {
  final DioBuilder dioBuilder;
  LoginDataSourceFirebase(this.dioBuilder);

  @override
  Future<void> loginMedico({required String email, required String senha}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email:'andre@email.com',
        password: senha,
      );
      userCredential.user?.getIdToken().then((value) {
        dioBuilder.saveKeys.saveToken(value);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CommonNoDataFoundError(message: 'Usuário não encontrado');
      } 
      if (e.code == 'wrong-password') {
        throw PasswordNoFoundError(message: 'Senha incorreta');
      }
      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<void> loginPaciente(String cpf) async {
      await FirebaseFirestore.instance.collection('pacientes').doc(cpf).get()
        .then((value) {
          if (!value.exists) {
            throw CommonNoDataFoundError(message: 'Usuário não encontrado');
          }
          dioBuilder.saveKeys.saveInfoUser(json.encode(value.data()));
        });
  }
  
}
