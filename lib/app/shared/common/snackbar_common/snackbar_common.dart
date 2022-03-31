import 'package:flutter/material.dart';

class SnackbarCommon {

  static chamarSnackBarMobile({
    required String text, 
    required BuildContext context,
    Color? backgroundColor,
  }){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: backgroundColor ?? Colors.red,
      content: Text(text),
    ));
  }
  static chamarSnackBarWeb({
    required String text, 
    required BuildContext context,
    Color? backgroundColor,
    })
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: backgroundColor ?? Colors.red,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        right: 50,
        left: 50
      ),
      content: Center(child: Text(text)),
    ));
  }
  
}