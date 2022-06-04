import 'package:flutter/material.dart';

class SnackBarWeb {

 static chamarSnackBarWeb({
    required String text, 
    required BuildContext context,
    Color? backgroundColor,
    })
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: backgroundColor ?? Colors.red,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height - 200,
        right: 100,
        left: 100
      ),
      content: Center(child: Text(text)),
    ));
  }

}