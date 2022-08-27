import 'package:flutter/material.dart';
import 'package:task/constants/style.dart';
import 'package:task/screens/post/post_screen.dart';
import 'package:task/screens/user/user_screen.dart';
import 'package:task/widgets/app_bar/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  final num id;

  HomeScreen({required this.id});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {},
            child: const Icon(Icons.add, color: Colors.white)),
        appBar: MyAppBar(
            context,
            scaffoldKey,
            () {},
            [
              const Tab(text: "Posts"),
              const Tab(text: "Profile"),
            ],
            "Home"),
        body: TabBarView(children: [PostScreen(id: id), UserScreen(id: id)]),
      ),
    );
  }
}
