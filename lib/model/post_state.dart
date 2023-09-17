import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'post_state.freezed.dart';
part 'post_state.g.dart';

//todo:PostをFreezedで書き換える←JsonSerializableを用いておこなった
//freeezedでもいけるよ！！！
@JsonSerializable(explicitToJson: true)
class Post {
  final String login;
  final String html_url;
  final String avatar_url;
  final int id;

  Post({
    required this.login,
    required this.html_url,
    required this.avatar_url,
    required this.id,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@freezed
class PostState with _$PostState {
  const factory PostState({
    @Default(0) int since,
    @Default([]) List<Post>? posts,
    @Default(true) bool isLoading,
    @Default(false) bool isLoadMoreError,
    @Default(false) bool isLoadMoreDone,
  }) = _PostState;

  const PostState._();
}
