import 'package:flutter/material.dart';
import 'package:task/constants/logos.dart';
import 'package:task/screens/home/home.dart';
import 'package:task/widgets/button/my_elevated_button.dart';
import 'package:task/widgets/text_field/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(appLogo),
              const SizedBox(height: 40),
              MyTextField(controller: emailController, hint: "Email"),
              const SizedBox(height: 20),
              MyTextField(controller: passwordController, hint: "Password"),
              const SizedBox(height: 40),
              MyElevatedButton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  title: "Login")
            ],
          ),
        ),
      ),
    );
  }
}
