import 'package:flutter/material.dart';
import 'package:task/constants/style.dart';

class MyElevatedButton extends StatelessWidget {
  final Function() onTap;
  final String title;

  const MyElevatedButton({required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape: const StadiumBorder(),
          minimumSize: const Size.fromHeight(50), // NEW
        ),
        onPressed: onTap,
        child: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)));
  }
}
