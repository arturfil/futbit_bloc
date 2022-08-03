import 'package:futbit_bloc/exceptions/exception.dart';
import 'package:futbit_bloc/models/custom_error.dart';
import 'package:futbit_bloc/services/group_api_service.dart';

import '../models/group.dart';

class GroupRepository {
  final GroupApiService groupApiService;
  GroupRepository({required this.groupApiService});

  Future<List<dynamic>> fetchGroups() async {
    try {
      final List<dynamic> groups = await groupApiService.getGroups();
      print('groups: $groups');
      return groups;
      
    } on GroupApiException catch (e) {
      throw CustomError(errMsg: e.message);

    } catch (e) {
      
      throw CustomError(errMsg: e.toString());
    }
  }
} 