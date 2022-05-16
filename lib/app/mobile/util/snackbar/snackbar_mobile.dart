import 'package:flutter/material.dart';

class SnackBarMobile {

  static chamarSnackBar({
    required String text, 
    required BuildContext context,
    Color? backgroundColor,
  }){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: backgroundColor ?? Colors.red,
      content: Text(text),
    ));
  }

}