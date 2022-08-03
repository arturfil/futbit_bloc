import 'package:flutter/material.dart';
import 'package:futbit_bloc/presentation/pages/add_group_page.dart';
import 'package:futbit_bloc/presentation/pages/home_page.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  final Map<String, dynamic> args = new Map<String, dynamic>();

  switch(setting.name) {
    case "/":
      return MaterialPageRoute(builder: (context) => const HomePage());
    case "/add_group":
      return MaterialPageRoute(builder: (context) => const AddGroupPage());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text("Default")),));
  }
}