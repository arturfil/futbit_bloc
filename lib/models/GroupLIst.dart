import 'package:equatable/equatable.dart';

import 'group.dart';

class GroupList extends Equatable {
  final List<dynamic> groups;

  GroupList({
    required this.groups,
  });

  factory GroupList.fromJson(Map<String, dynamic> json) {
    final groups = json['groups'][0];
    print("TEST -> " + json.toString());
    var groupsToReturn = GroupList(groups: groups);
    print("IN GROUPLILST CLASS -> " + groupsToReturn.toString());
    return GroupList(groups: groups);
  }

  factory GroupList.initial() => GroupList(groups: []);

  @override
  List<Object> get props => [groups];

  GroupList copyWith({
    List<Group>? groups,
  }) {
    return GroupList(
      groups: groups ?? this.groups,
    );
  }

  @override
  bool get stringify => true;
}
