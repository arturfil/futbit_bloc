import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:futbit_bloc/repositories/GroupRepository.dart';

import '../models/custom_error.dart';
import '../models/group.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final GroupRepository groupRepository;
  GroupCubit({required this.groupRepository}) : super(GroupState.initial());

  Future<void> fetchGroups() async {
    emit(state.copyWith(status: GroupStatus.loading));
    try {
      final dynamic group = await groupRepository.fetchGroups();
      emit(state.copyWith(status: GroupStatus.loaded, group: group));
    } on CustomError catch (e) {
      emit(state.copyWith(
        status: GroupStatus.error,
        error: e
      ));
      print('state: $state');
    }
  }
}
