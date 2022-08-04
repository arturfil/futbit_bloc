// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'group.dart';

class GroupList extends Equatable {
  final List<Group> groups;

  GroupList({
    required this.groups,
  });

  factory GroupList.fromJson(Map<String, dynamic> json) {
    final groups = json['groups'][0];
    print("IN GROUPLILST CLASS -> " + groups);
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
