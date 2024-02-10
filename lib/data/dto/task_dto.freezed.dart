// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) {
  return _TaskDto.fromJson(json);
}

/// @nodoc
mixin _$TaskDto {
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get date => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDtoCopyWith<TaskDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDtoCopyWith<$Res> {
  factory $TaskDtoCopyWith(TaskDto value, $Res Function(TaskDto) then) = _$TaskDtoCopyWithImpl<$Res, TaskDto>;
  @useResult
  $Res call({String title, String category, String color, @TimestampConverter() DateTime date, bool isCompleted});
}

/// @nodoc
class _$TaskDtoCopyWithImpl<$Res, $Val extends TaskDto> implements $TaskDtoCopyWith<$Res> {
  _$TaskDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? category = null,
    Object? color = null,
    Object? date = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskDtoImplCopyWith<$Res> implements $TaskDtoCopyWith<$Res> {
  factory _$$TaskDtoImplCopyWith(_$TaskDtoImpl value, $Res Function(_$TaskDtoImpl) then) =
      __$$TaskDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String category, String color, @TimestampConverter() DateTime date, bool isCompleted});
}

/// @nodoc
class __$$TaskDtoImplCopyWithImpl<$Res> extends _$TaskDtoCopyWithImpl<$Res, _$TaskDtoImpl>
    implements _$$TaskDtoImplCopyWith<$Res> {
  __$$TaskDtoImplCopyWithImpl(_$TaskDtoImpl _value, $Res Function(_$TaskDtoImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? category = null,
    Object? color = null,
    Object? date = null,
    Object? isCompleted = null,
  }) {
    return _then(_$TaskDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskDtoImpl implements _TaskDto {
  const _$TaskDtoImpl(
      {required this.title,
      required this.category,
      required this.color,
      @TimestampConverter() required this.date,
      required this.isCompleted});

  factory _$TaskDtoImpl.fromJson(Map<String, dynamic> json) => _$$TaskDtoImplFromJson(json);

  @override
  final String title;
  @override
  final String category;
  @override
  final String color;
  @override
  @TimestampConverter()
  final DateTime date;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'TaskDto(title: $title, category: $category, color: $color, date: $date, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) || other.category == category) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, category, color, date, isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDtoImplCopyWith<_$TaskDtoImpl> get copyWith => __$$TaskDtoImplCopyWithImpl<_$TaskDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskDtoImplToJson(
      this,
    );
  }
}

abstract class _TaskDto implements TaskDto {
  const factory _TaskDto(
      {required final String title,
      required final String category,
      required final String color,
      @TimestampConverter() required final DateTime date,
      required final bool isCompleted}) = _$TaskDtoImpl;

  factory _TaskDto.fromJson(Map<String, dynamic> json) = _$TaskDtoImpl.fromJson;

  @override
  String get title;
  @override
  String get category;
  @override
  String get color;
  @override
  @TimestampConverter()
  DateTime get date;
  @override
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$TaskDtoImplCopyWith<_$TaskDtoImpl> get copyWith => throw _privateConstructorUsedError;
}
