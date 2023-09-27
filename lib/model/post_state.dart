import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'post_state.freezed.dart';
part 'post_state.g.dart';

//todo:freeezedで書き直した（jsonなんとかよりもこっちの方がスッキリ）
@freezed
class Post with _$Post {
  const factory Post({
    required String login,
    required String html_url,
    required String avatar_url,
    required int id,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
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
