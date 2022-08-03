import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:futbit_bloc/models/custom_error.dart';
import 'package:futbit_bloc/repositories/GroupRepository.dart';

import '../../models/GroupLIst.dart';
import '../../models/group.dart';

part 'group_list_state.dart';

class GroupListCubit extends Cubit<GroupListState> {
  final GroupRepository groupRepository;
  GroupListCubit({required this.groupRepository}) : super(GroupListState.initial());

  Future<void> fetchGroups() async {
    try {
      final GroupList groups = await groupRepository.fetchGroups();
      emit(state.copyWith(status: GroupListStatus.loaded, groups: groups));
    } catch (e) {
      
    }
  }
}
