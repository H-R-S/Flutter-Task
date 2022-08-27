import 'package:flutter/material.dart';
import 'package:task/constants/style.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final bool isVisible;
  final Function()? onTap;

  const MyTextField(
      {required this.controller,
      required this.hint,
      this.isVisible = false,
      this.isPassword = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      obscureText: isVisible,
      cursorColor: Colors.grey,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: isPassword
              ? Icon(isVisible ? Icons.visibility_off : Icons.visibility,
                  color: primaryColor)
              : null,
          filled: true,
          fillColor: lightGrey,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: lightGrey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: lightGrey)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: lightGrey),
              borderRadius: BorderRadius.circular(15)),
          hintText: hint),
    );
  }
}
