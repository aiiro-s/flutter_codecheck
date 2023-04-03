// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailPageState {
  RepositoryItem get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailPageStateCopyWith<DetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailPageStateCopyWith<$Res> {
  factory $DetailPageStateCopyWith(
          DetailPageState value, $Res Function(DetailPageState) then) =
      _$DetailPageStateCopyWithImpl<$Res, DetailPageState>;
  @useResult
  $Res call({RepositoryItem item});

  $RepositoryItemCopyWith<$Res> get item;
}

/// @nodoc
class _$DetailPageStateCopyWithImpl<$Res, $Val extends DetailPageState>
    implements $DetailPageStateCopyWith<$Res> {
  _$DetailPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as RepositoryItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RepositoryItemCopyWith<$Res> get item {
    return $RepositoryItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DetailPageStateCopyWith<$Res>
    implements $DetailPageStateCopyWith<$Res> {
  factory _$$_DetailPageStateCopyWith(
          _$_DetailPageState value, $Res Function(_$_DetailPageState) then) =
      __$$_DetailPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RepositoryItem item});

  @override
  $RepositoryItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_DetailPageStateCopyWithImpl<$Res>
    extends _$DetailPageStateCopyWithImpl<$Res, _$_DetailPageState>
    implements _$$_DetailPageStateCopyWith<$Res> {
  __$$_DetailPageStateCopyWithImpl(
      _$_DetailPageState _value, $Res Function(_$_DetailPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_DetailPageState(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as RepositoryItem,
    ));
  }
}

/// @nodoc

class _$_DetailPageState implements _DetailPageState {
  const _$_DetailPageState({required this.item});

  @override
  final RepositoryItem item;

  @override
  String toString() {
    return 'DetailPageState(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailPageState &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailPageStateCopyWith<_$_DetailPageState> get copyWith =>
      __$$_DetailPageStateCopyWithImpl<_$_DetailPageState>(this, _$identity);
}

abstract class _DetailPageState implements DetailPageState {
  const factory _DetailPageState({required final RepositoryItem item}) =
      _$_DetailPageState;

  @override
  RepositoryItem get item;
  @override
  @JsonKey(ignore: true)
  _$$_DetailPageStateCopyWith<_$_DetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
