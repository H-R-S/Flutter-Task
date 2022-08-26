import 'package:flutter/material.dart';
import 'package:task/constants/style.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;

  const MyTextField(
      {required this.controller, required this.hint, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      controller: controller,
      decoration: InputDecoration(
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
