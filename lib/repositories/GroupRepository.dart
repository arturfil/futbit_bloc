import 'package:futbit_bloc/exceptions/exception.dart';
import 'package:futbit_bloc/models/GroupLIst.dart';
import 'package:futbit_bloc/models/custom_error.dart';
import 'package:futbit_bloc/services/group_api_service.dart';

class GroupRepository {
  final GroupApiService groupApiService;
  GroupRepository({required this.groupApiService});

  Future<GroupList> fetchGroups() async {
    try {
      final GroupList groups = await groupApiService.getGroups();
      return groups;
      
    } on GroupApiException catch (e) {
      throw CustomError(errMsg: e.message);

    } catch (e) {
      
      throw CustomError(errMsg: e.toString());
    }
  }
} 