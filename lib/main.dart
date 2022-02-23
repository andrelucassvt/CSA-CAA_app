import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/app_widget.dart';
import 'package:projeto_csa_app/app/shared/inject/inject_dependency.dart';

void main() {
  InjectDependency.init();
  runApp(const AppWidget());
}