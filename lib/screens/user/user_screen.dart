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
  bool isLoaded = false;
  List<UserModel> user = [];

  @override
  void initState() {
    super.initState();

    getUserData(widget.id);
  }

  getUserData(id) async {
    user = await APIService.getUser(id);

    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isLoaded,
        replacement:
            const Center(child: CircularProgressIndicator(color: primaryColor)),
        child: ListView.builder(
            itemCount: user.length,
            itemBuilder: (context, index) {
              return Column(children: [
                UserDetailContainer(
                    title: 'Name', body: user[index].name ?? ""),
                UserDetailContainer(
                    title: 'Username', body: user[index].username ?? ""),
                UserDetailContainer(
                    title: 'Address',
                    body: user[index].address!.street! +
                        ", " +
                        user[index].address!.suite! +
                        ", " +
                        user[index].address!.city!),
                UserDetailContainer(
                    title: 'Zip-code',
                    body: user[index].address!.zipcode ?? ""),
              ]);
            }));
  }
}
