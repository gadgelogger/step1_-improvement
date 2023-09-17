// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostState {
  int get since => throw _privateConstructorUsedError;
  List<Post>? get posts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadMoreError => throw _privateConstructorUsedError;
  bool get isLoadMoreDone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostStateCopyWith<PostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res, PostState>;
  @useResult
  $Res call(
      {int since,
      List<Post>? posts,
      bool isLoading,
      bool isLoadMoreError,
      bool isLoadMoreDone});
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res, $Val extends PostState>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? since = null,
    Object? posts = freezed,
    Object? isLoading = null,
    Object? isLoadMoreError = null,
    Object? isLoadMoreDone = null,
  }) {
    return _then(_value.copyWith(
      since: null == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as int,
      posts: freezed == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMoreError: null == isLoadMoreError
          ? _value.isLoadMoreError
          : isLoadMoreError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMoreDone: null == isLoadMoreDone
          ? _value.isLoadMoreDone
          : isLoadMoreDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$$_PostStateCopyWith(
          _$_PostState value, $Res Function(_$_PostState) then) =
      __$$_PostStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int since,
      List<Post>? posts,
      bool isLoading,
      bool isLoadMoreError,
      bool isLoadMoreDone});
}

/// @nodoc
class __$$_PostStateCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_PostState>
    implements _$$_PostStateCopyWith<$Res> {
  __$$_PostStateCopyWithImpl(
      _$_PostState _value, $Res Function(_$_PostState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? since = null,
    Object? posts = freezed,
    Object? isLoading = null,
    Object? isLoadMoreError = null,
    Object? isLoadMoreDone = null,
  }) {
    return _then(_$_PostState(
      since: null == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as int,
      posts: freezed == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMoreError: null == isLoadMoreError
          ? _value.isLoadMoreError
          : isLoadMoreError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMoreDone: null == isLoadMoreDone
          ? _value.isLoadMoreDone
          : isLoadMoreDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PostState extends _PostState with DiagnosticableTreeMixin {
  const _$_PostState(
      {this.since = 0,
      final List<Post>? posts = const [],
      this.isLoading = true,
      this.isLoadMoreError = false,
      this.isLoadMoreDone = false})
      : _posts = posts,
        super._();

  @override
  @JsonKey()
  final int since;
  final List<Post>? _posts;
  @override
  @JsonKey()
  List<Post>? get posts {
    final value = _posts;
    if (value == null) return null;
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadMoreError;
  @override
  @JsonKey()
  final bool isLoadMoreDone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostState(since: $since, posts: $posts, isLoading: $isLoading, isLoadMoreError: $isLoadMoreError, isLoadMoreDone: $isLoadMoreDone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostState'))
      ..add(DiagnosticsProperty('since', since))
      ..add(DiagnosticsProperty('posts', posts))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isLoadMoreError', isLoadMoreError))
      ..add(DiagnosticsProperty('isLoadMoreDone', isLoadMoreDone));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostState &&
            (identical(other.since, since) || other.since == since) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadMoreError, isLoadMoreError) ||
                other.isLoadMoreError == isLoadMoreError) &&
            (identical(other.isLoadMoreDone, isLoadMoreDone) ||
                other.isLoadMoreDone == isLoadMoreDone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      since,
      const DeepCollectionEquality().hash(_posts),
      isLoading,
      isLoadMoreError,
      isLoadMoreDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostStateCopyWith<_$_PostState> get copyWith =>
      __$$_PostStateCopyWithImpl<_$_PostState>(this, _$identity);
}

abstract class _PostState extends PostState {
  const factory _PostState(
      {final int since,
      final List<Post>? posts,
      final bool isLoading,
      final bool isLoadMoreError,
      final bool isLoadMoreDone}) = _$_PostState;
  const _PostState._() : super._();

  @override
  int get since;
  @override
  List<Post>? get posts;
  @override
  bool get isLoading;
  @override
  bool get isLoadMoreError;
  @override
  bool get isLoadMoreDone;
  @override
  @JsonKey(ignore: true)
  _$$_PostStateCopyWith<_$_PostState> get copyWith =>
      throw _privateConstructorUsedError;
}
