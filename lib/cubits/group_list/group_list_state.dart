part of 'group_list_cubit.dart';

class GroupListState extends Equatable {
  final List<Group> groups;
  GroupListState({
    required this.groups,
  });

  factory GroupListState.initial() {
    return GroupListState(groups: [
      Group(
        id: '123412',
        name: 'Fofana',
        created_at: 'Monday',
        updated_at: 'Tuesday'
      ),
    ]);
  }

  @override
  List<Object> get props => [groups];

  @override
  bool get stringify => true;

  GroupListState copyWith({
    List<Group>? groups,
  }) {
    return GroupListState(
      groups: groups ?? this.groups,
    );
  }
}
