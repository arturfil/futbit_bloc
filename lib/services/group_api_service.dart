import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:futbit_bloc/constants/constants.dart';
import 'package:futbit_bloc/exceptions/exception.dart';
import 'package:futbit_bloc/models/GroupLIst.dart';
import 'package:futbit_bloc/services/http_error_handler.dart';
import 'package:http/http.dart' as http;

import '../models/group.dart';

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
      print(responseJson['groups']);
      if (response.statusCode != 200) {
        throw GroupApiException();
      }
      // final responseBody = json.decode(response.body);
      return responseJson['groups'];
    } catch (e) {
      rethrow;
    }
  }
}
