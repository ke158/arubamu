// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'diary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiaryState {
  Diary? get diary => throw _privateConstructorUsedError;
  List<Diary> get diarys => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiaryStateCopyWith<DiaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryStateCopyWith<$Res> {
  factory $DiaryStateCopyWith(
          DiaryState value, $Res Function(DiaryState) then) =
      _$DiaryStateCopyWithImpl<$Res, DiaryState>;
  @useResult
  $Res call({Diary? diary, List<Diary> diarys});

  $DiaryCopyWith<$Res>? get diary;
}

/// @nodoc
class _$DiaryStateCopyWithImpl<$Res, $Val extends DiaryState>
    implements $DiaryStateCopyWith<$Res> {
  _$DiaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diary = freezed,
    Object? diarys = null,
  }) {
    return _then(_value.copyWith(
      diary: freezed == diary
          ? _value.diary
          : diary // ignore: cast_nullable_to_non_nullable
              as Diary?,
      diarys: null == diarys
          ? _value.diarys
          : diarys // ignore: cast_nullable_to_non_nullable
              as List<Diary>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiaryCopyWith<$Res>? get diary {
    if (_value.diary == null) {
      return null;
    }

    return $DiaryCopyWith<$Res>(_value.diary!, (value) {
      return _then(_value.copyWith(diary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DiaryStateCopyWith<$Res>
    implements $DiaryStateCopyWith<$Res> {
  factory _$$_DiaryStateCopyWith(
          _$_DiaryState value, $Res Function(_$_DiaryState) then) =
      __$$_DiaryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Diary? diary, List<Diary> diarys});

  @override
  $DiaryCopyWith<$Res>? get diary;
}

/// @nodoc
class __$$_DiaryStateCopyWithImpl<$Res>
    extends _$DiaryStateCopyWithImpl<$Res, _$_DiaryState>
    implements _$$_DiaryStateCopyWith<$Res> {
  __$$_DiaryStateCopyWithImpl(
      _$_DiaryState _value, $Res Function(_$_DiaryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diary = freezed,
    Object? diarys = null,
  }) {
    return _then(_$_DiaryState(
      diary: freezed == diary
          ? _value.diary
          : diary // ignore: cast_nullable_to_non_nullable
              as Diary?,
      diarys: null == diarys
          ? _value._diarys
          : diarys // ignore: cast_nullable_to_non_nullable
              as List<Diary>,
    ));
  }
}

/// @nodoc

class _$_DiaryState extends _DiaryState {
  const _$_DiaryState({this.diary, final List<Diary> diarys = const []})
      : _diarys = diarys,
        super._();

  @override
  final Diary? diary;
  final List<Diary> _diarys;
  @override
  @JsonKey()
  List<Diary> get diarys {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diarys);
  }

  @override
  String toString() {
    return 'DiaryState(diary: $diary, diarys: $diarys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiaryState &&
            (identical(other.diary, diary) || other.diary == diary) &&
            const DeepCollectionEquality().equals(other._diarys, _diarys));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, diary, const DeepCollectionEquality().hash(_diarys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiaryStateCopyWith<_$_DiaryState> get copyWith =>
      __$$_DiaryStateCopyWithImpl<_$_DiaryState>(this, _$identity);
}

abstract class _DiaryState extends DiaryState {
  const factory _DiaryState({final Diary? diary, final List<Diary> diarys}) =
      _$_DiaryState;
  const _DiaryState._() : super._();

  @override
  Diary? get diary;
  @override
  List<Diary> get diarys;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryStateCopyWith<_$_DiaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
