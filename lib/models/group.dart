// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final String id;
  final String name;
  final String created_at;
  final String updated_at;

  Group({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    final group = json['group'][0];
    final main = json['main'];

    return Group(
      id: group['id'],
      name: group['name'],
      created_at: group['created_at'],
      updated_at: group['updated_at']
    );
  }

  factory Group.initial() => Group(
    id: '',
    name: '',
    created_at: '',
    updated_at: ''
  );

  @override
  List<Object> get props => [id, name, created_at, updated_at];

  Group copyWith({
    String? id,
    String? name,
    String? created_at,
    String? updated_at,
  }) {
    return Group(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  @override
  bool get stringify => true;
}
