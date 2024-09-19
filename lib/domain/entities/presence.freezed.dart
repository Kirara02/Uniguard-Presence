// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Presence _$PresenceFromJson(Map<String, dynamic> json) {
  return _Presence.fromJson(json);
}

/// @nodoc
mixin _$Presence {
  String get date => throw _privateConstructorUsedError;
  String get checkIn => throw _privateConstructorUsedError;
  String get checkOut => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PresenceCopyWith<Presence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceCopyWith<$Res> {
  factory $PresenceCopyWith(Presence value, $Res Function(Presence) then) =
      _$PresenceCopyWithImpl<$Res, Presence>;
  @useResult
  $Res call({String date, String checkIn, String checkOut});
}

/// @nodoc
class _$PresenceCopyWithImpl<$Res, $Val extends Presence>
    implements $PresenceCopyWith<$Res> {
  _$PresenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? checkIn = null,
    Object? checkOut = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      checkIn: null == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String,
      checkOut: null == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PresenceImplCopyWith<$Res>
    implements $PresenceCopyWith<$Res> {
  factory _$$PresenceImplCopyWith(
          _$PresenceImpl value, $Res Function(_$PresenceImpl) then) =
      __$$PresenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, String checkIn, String checkOut});
}

/// @nodoc
class __$$PresenceImplCopyWithImpl<$Res>
    extends _$PresenceCopyWithImpl<$Res, _$PresenceImpl>
    implements _$$PresenceImplCopyWith<$Res> {
  __$$PresenceImplCopyWithImpl(
      _$PresenceImpl _value, $Res Function(_$PresenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? checkIn = null,
    Object? checkOut = null,
  }) {
    return _then(_$PresenceImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      checkIn: null == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String,
      checkOut: null == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PresenceImpl implements _Presence {
  _$PresenceImpl(
      {required this.date, required this.checkIn, required this.checkOut});

  factory _$PresenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenceImplFromJson(json);

  @override
  final String date;
  @override
  final String checkIn;
  @override
  final String checkOut;

  @override
  String toString() {
    return 'Presence(date: $date, checkIn: $checkIn, checkOut: $checkOut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, checkIn, checkOut);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceImplCopyWith<_$PresenceImpl> get copyWith =>
      __$$PresenceImplCopyWithImpl<_$PresenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PresenceImplToJson(
      this,
    );
  }
}

abstract class _Presence implements Presence {
  factory _Presence(
      {required final String date,
      required final String checkIn,
      required final String checkOut}) = _$PresenceImpl;

  factory _Presence.fromJson(Map<String, dynamic> json) =
      _$PresenceImpl.fromJson;

  @override
  String get date;
  @override
  String get checkIn;
  @override
  String get checkOut;
  @override
  @JsonKey(ignore: true)
  _$$PresenceImplCopyWith<_$PresenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
