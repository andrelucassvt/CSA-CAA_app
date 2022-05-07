import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/app_widget.dart';
import 'package:projeto_csa_app/app/shared/inject/inject_dependency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  InjectDependency.init();
  runApp(const AppWidget());
}