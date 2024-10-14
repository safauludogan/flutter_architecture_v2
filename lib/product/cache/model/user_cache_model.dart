// ignore_for_file: public_member_api_docs

import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

final class UserCacheModel with CacheModel<UserCacheModel> {
  UserCacheModel({required this.user});
  UserCacheModel.empty() : user = User();

  final User user;

  @override
  UserCacheModel fromJson(Map<String, dynamic> json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<User>('Json cannot be null');
      return this;
    }
    return copyWith(user: User.fromJson(jsonMap));
  }

  @override
  Map<String, dynamic> toJson() => user.toJson();

  UserCacheModel copyWith({User? user}) {
    return UserCacheModel(
      user: user ?? this.user,
    );
  }

  @override
  String get cacheId => user.id.toString();
}
