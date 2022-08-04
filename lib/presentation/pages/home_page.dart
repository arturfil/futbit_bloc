import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futbit_bloc/cubits/group_list/group_list_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState( ){
    super.initState();
    _fetchGroups();
  }

  _fetchGroups() {
     context.read<GroupListCubit>().fetchGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/add_group");
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
