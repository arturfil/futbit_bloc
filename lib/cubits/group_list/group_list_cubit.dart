import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:futbit_bloc/models/custom_error.dart';
import 'package:futbit_bloc/repositories/GroupRepository.dart';

import '../../models/GroupLIst.dart';

part 'group_list_state.dart';

class GroupListCubit extends Cubit<GroupListState> {
  final GroupRepository groupRepository;
  GroupListCubit({required this.groupRepository}) : super(GroupListState.initial());

  Future<void> fetchGroups() async {
    emit(state.copyWith(status: GroupListStatus.loading));
    try {
      print("Inside Try");
      final GroupList groups = await groupRepository.fetchGroups();
      emit(state.copyWith(status: GroupListStatus.loaded, groups: groups));
      // print("IN CUBIT-> " + groups.toString()); // WORKS
      print(state.groups.groups); // WORKS
    } on CustomError catch (e) {
      print("ERROR XX " + e.toString());
      emit(state.copyWith(status: GroupListStatus.error, error: e));
    }
  }
}
