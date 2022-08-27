import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/constants/style.dart';
import 'package:task/model/user/user_model.dart';
import 'package:task/services/api_service.dart';
import 'package:task/widgets/user_detail_container/user_detail_container.dart';

class UserScreen extends StatefulWidget {
  final num id;

  const UserScreen({required this.id});

  @override
  State<UserScreen> createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {
  bool isLoading = false;
  UserModel user = UserModel();

  @override
  void initState() {
    super.initState();

    getUserData(widget.id);
  }

  getUserData(id) async {
    user = await APIService.getUser(id) ?? UserModel();

    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isLoading,
        replacement:
            const Center(child: CircularProgressIndicator(color: primaryColor)),
        child: Column(
          children: [
            UserDetailContainer(title: "Name", body: user.name ?? ''),
            UserDetailContainer(title: "Username", body: user.username ?? ''),
            UserDetailContainer(
                title: "Address", body: user.address!.street ?? ''),
            UserDetailContainer(
                title: "Zipcode", body: user.address!.zipcode ?? ''),
          ],
        ));
  }
}
