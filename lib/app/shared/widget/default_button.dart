import 'package:flutter/material.dart';

class DefaultButtonApp extends StatelessWidget {
  final String textButton;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? circularProgressColor;
  final Color? textColor;
  final Color? borderButtonColor;
  final double? width;
  final double? height;
  final Function() actionButton;
  const DefaultButtonApp({
    Key? key,
    required this.textButton,
    required this.actionButton,
    this.backgroundColor,
    this.isLoading = false,
    this.width,
    this.height,
    this.textColor,
    this.borderButtonColor,
    this.circularProgressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(width ?? 280, height ?? 55),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor ?? Theme.of(context).primaryColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            side: BorderSide(
              color: borderButtonColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: !isLoading ? actionButton : null, 
      child: isLoading
        ? CircularProgressIndicator(color: circularProgressColor ?? Colors.white)
        : Text(
          textButton,
          style: TextStyle(
            fontSize: 16,
            color: textColor ?? Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
    );
  }
}