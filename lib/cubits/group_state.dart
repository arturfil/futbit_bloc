part of 'group_cubit.dart';

enum GroupStatus {
  initial,
  loading,
  loaded,
  error
}

class GroupState extends Equatable {
  final GroupStatus status;
  final Group group;
  final CustomError error;

  GroupState({
    required this.status,
    required this.group,
    required this.error,
  });

  factory GroupState.initial() {
    return GroupState(
      status: GroupStatus.initial,
      group: Group.initial(),
      error: CustomError(),
    );
  }
 
  @override
  List<Object> get props => [status, group, error];

  @override
  bool get stringify => true;

  GroupState copyWith({
    GroupStatus? status,
    Group? group,
    CustomError? error,
  }) {
    return GroupState(
      status: status ?? this.status,
      group: group ?? this.group,
      error: error ?? this.error,
    );
  }
}

