import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projeto_csa_app/app/app_widget.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/inject/inject_dependency.dart';
import 'package:projeto_csa_app/app/common/strings_app.dart';

  
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(InteracaoEntityAdapter());
  await Hive.openBox<InteracaoEntity>(nametable);
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  InjectDependency.init();
  runApp(const AppWidget());
}