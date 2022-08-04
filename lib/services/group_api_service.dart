import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:futbit_bloc/exceptions/exception.dart';
import 'package:futbit_bloc/models/GroupLIst.dart';
import 'package:http/http.dart' as http;


class GroupApiService {
  final http.Client httpClient;
  GroupApiService({required this.httpClient});

  Future<GroupList> getGroups() async {
    String? apiUrl = dotenv.env['api_url'];
    var url = Uri.parse(apiUrl.toString() + '/groups');
    
    const Map<String, String> header = {
      'Content-type': 'application/json; charset=utf-8',
      'Accept': 'application/json',
    };

    try {
      var response = (await http.get(url, headers: header));
      var responseJson = await json.decode(response.body);
      if (response.statusCode != 200) {
        throw GroupApiException();
      }
      // Uncomment this to see how the api works
      // print("response -> " + responseJson['groups'].toString());
      // var 
      return GroupList(groups: responseJson['groups']);
    } catch (e) {
      rethrow;
    }
  }
}
