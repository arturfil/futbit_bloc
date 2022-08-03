// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'group_list_cubit.dart';

enum GroupListStatus {
  initial,
  loading,
  loaded,
  error
}

class GroupListState extends Equatable {
  final GroupList groups;
  final CustomError error;
  final GroupListStatus status;
  GroupListState({
    required this.groups,
    required this.status,
    required this.error
  });
  

  factory GroupListState.initial() {
    return GroupListState(
      status: GroupListStatus.initial,
      groups: GroupList.initial(),
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [groups];


  GroupListState copyWith({
    GroupList? groups,
    CustomError? error,
    GroupListStatus? status,
  }) {
    return GroupListState(
      groups: groups ?? this.groups,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }
}
