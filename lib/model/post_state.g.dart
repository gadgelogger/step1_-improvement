// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      login: json['login'] as String,
      html_url: json['html_url'] as String,
      avatar_url: json['avatar_url'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'login': instance.login,
      'html_url': instance.html_url,
      'avatar_url': instance.avatar_url,
      'id': instance.id,
    };
