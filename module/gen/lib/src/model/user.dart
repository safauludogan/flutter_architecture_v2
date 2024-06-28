// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends IDioNexusNetworkModel<User> with EquatableMixin {
  User({this.userId, this.id, this.title, this.body});

  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  @override
  List<Object?> get props => [userId, id, title, body];

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return User(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);
}
