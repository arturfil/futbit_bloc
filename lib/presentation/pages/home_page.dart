import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futbit_bloc/cubits/group_list/group_list_cubit.dart';
import 'package:futbit_bloc/models/GroupLIst.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _fetchGroups();
  }

  _fetchGroups() {
    context.read<GroupListCubit>().fetchGroups();
  }

  @override
  Widget build(BuildContext context) {
    final groups = context.watch<GroupListCubit>().state.groups;
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
        body: getBody(groups));
  }

  Widget getBody(GroupList groups) {
      return ListView.builder(
        itemCount: groups.groups.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: BlueBox(groups.groups[index]["name"]),
          );
        },
    );
  }

  Widget BlueBox(String title) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 50, 64, 75),
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
