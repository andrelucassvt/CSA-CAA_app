import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/cubit/login_cubit.dart';

class AuthMedicoLoginPage extends StatefulWidget {
  const AuthMedicoLoginPage({ Key? key }) : super(key: key);

  @override
  _AuthMedicoLoginPageState createState() => _AuthMedicoLoginPageState();
}

class _AuthMedicoLoginPageState extends State<AuthMedicoLoginPage> {
  final controller = GetIt.I.get<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}