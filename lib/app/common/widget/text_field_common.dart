import 'package:flutter/material.dart';

class TextFieldCommon extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const TextFieldCommon({ Key? key, required this.label, required this.controller }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue, 
              width: 2.0
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey, 
              width: 1.0
            ),
          ),
        ),
      ),
    );
  }
}