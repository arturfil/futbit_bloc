import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:futbit_bloc/repositories/GroupRepository.dart';

import '../../models/group.dart';

part 'group_list_state.dart';

class GroupListCubit extends Cubit<GroupListState> {
  final GroupRepository groupRepository;
  GroupListCubit({required this.groupRepository}) : super(GroupListState.initial());

  Future<void> fetchGroups() async {
    try {
      final List groups = await groupRepository.fetchGroups();
    } catch (e) {
      
    }
  }
}
