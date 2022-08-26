import 'package:flutter/material.dart';
import 'package:task/constants/style.dart';

AppBar MyAppBar(BuildContext context, GlobalKey<ScaffoldState> key,
    Function() onTapMenu, List<Widget> tabs, String title) {
  return AppBar(
      backgroundColor: primaryColor,
      leading: IconButton(
          onPressed: onTapMenu,
          icon: const Icon(Icons.menu, color: Colors.white)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      bottom: TabBar(indicatorColor: Colors.white, tabs: tabs));
}