import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_csa_app/app/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/domain/datasource/auth_mobile_datasource.dart';
import 'package:projeto_csa_app/app/common/database/manager_keys.dart';

class AuthMobileDataSourceImpl extends AuthMobileDataSource {
  final ManagerKeys managerKeys;
  AuthMobileDataSourceImpl({required this.managerKeys});

  @override
  Future<void> login({required String cpf}) async {
    await FirebaseFirestore.instance.collection('pacientes').doc(cpf).get()
      .then((value) {
        if (!value.exists) {
          throw CommonNoDataFoundError(message: 'Usuário não encontrado');
        }
        managerKeys.saveInfoUser(json.encode(value.data()));
      });
  }
  
}