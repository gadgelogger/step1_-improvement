// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      login: json['login'] as String,
      htmlUrl: json['htmlUrl'] as String,
      avatarUrl: json['avatarUrl'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'login': instance.login,
      'htmlUrl': instance.htmlUrl,
      'avatarUrl': instance.avatarUrl,
      'id': instance.id,
    };
