import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final Widget? suffixIcon;

  TextFormFieldWidget({
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: suffixIcon,
        hintStyle: TextStyle(color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
      ),
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
    );
  }
}
