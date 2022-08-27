import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:task/constants/logos.dart';
import 'package:task/screens/home/home.dart';
import 'package:task/widgets/button/my_elevated_button.dart';
import 'package:task/widgets/snack_bar/my_snack_bar.dart';
import 'package:task/widgets/text_field/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  final String apiUrl = "https://jsonplaceholder.typicode.com/users";

  fetchUsers() async {
    var result = await http.get(
      Uri.parse(apiUrl),
    );
    print("======================fetchUsers==========================");

    setState(() {
      data = json.decode(result.body);
    });
  }

  var data = [];

  bool isLoading = false;

  final TextEditingController useremailcontroller =
      TextEditingController(text: "Shanna@melissa.tv");
  final TextEditingController userpasswordcontroller =
      TextEditingController(text: "Antonette");

  void register() async {
    setState(() {
      isLoading = true;
    });
    final String useremail = useremailcontroller.text.trim();
    final String userpassword = userpasswordcontroller.text;
    var count = 0;
    for (var i = 0; i < data.length; i++) {
      if (data[i]["email"] == useremail &&
          data[i]["username"] == userpassword) {
        count++;

        MySnackBar(context, "login sucessfully");

        setState(() {
          id = data[i]["id"];
        });

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeScreen(id: id)));
      }
      if (i == data.length - 1 && count == 0) {
        MySnackBar(context, "login failed");
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  num id = 0;

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(appLogo),
              const SizedBox(height: 40),
              MyTextField(controller: useremailcontroller, hint: "Email"),
              const SizedBox(height: 20),
              MyTextField(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  isVisible: isVisible,
                  isPassword: true,
                  controller: userpasswordcontroller,
                  hint: "Password"),
              const SizedBox(height: 40),
              MyElevatedButton(
                  onTap: () {
                    register();
                  },
                  title: "Login")
            ],
          ),
        ),
      ),
    );
  }
}
