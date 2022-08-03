import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futbit_bloc/repositories/GroupRepository.dart';
import 'package:futbit_bloc/services/group_api_service.dart';
import 'package:http/http.dart' as http;

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
    GroupRepository(groupApiService: GroupApiService(httpClient: http.Client())).fetchGroups();
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
