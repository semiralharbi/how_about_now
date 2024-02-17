// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskCategoryDto {
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  List<TaskDto> get tasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCategoryDtoCopyWith<TaskCategoryDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCategoryDtoCopyWith<$Res> {
  factory $TaskCategoryDtoCopyWith(TaskCategoryDto value, $Res Function(TaskCategoryDto) then) =
      _$TaskCategoryDtoCopyWithImpl<$Res, TaskCategoryDto>;
  @useResult
  $Res call({String name, String color, List<TaskDto> tasks});
}

/// @nodoc
class _$TaskCategoryDtoCopyWithImpl<$Res, $Val extends TaskCategoryDto> implements $TaskCategoryDtoCopyWith<$Res> {
  _$TaskCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskCategoryDtoImplCopyWith<$Res> implements $TaskCategoryDtoCopyWith<$Res> {
  factory _$$TaskCategoryDtoImplCopyWith(_$TaskCategoryDtoImpl value, $Res Function(_$TaskCategoryDtoImpl) then) =
      __$$TaskCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String color, List<TaskDto> tasks});
}

/// @nodoc
class __$$TaskCategoryDtoImplCopyWithImpl<$Res> extends _$TaskCategoryDtoCopyWithImpl<$Res, _$TaskCategoryDtoImpl>
    implements _$$TaskCategoryDtoImplCopyWith<$Res> {
  __$$TaskCategoryDtoImplCopyWithImpl(_$TaskCategoryDtoImpl _value, $Res Function(_$TaskCategoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
    Object? tasks = null,
  }) {
    return _then(_$TaskCategoryDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskDto>,
    ));
  }
}

/// @nodoc

class _$TaskCategoryDtoImpl extends _TaskCategoryDto {
  const _$TaskCategoryDtoImpl({required this.name, required this.color, required final List<TaskDto> tasks})
      : _tasks = tasks,
        super._();

  @override
  final String name;
  @override
  final String color;
  final List<TaskDto> _tasks;
  @override
  List<TaskDto> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TaskCategoryDto(name: $name, color: $color, tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskCategoryDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, color, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskCategoryDtoImplCopyWith<_$TaskCategoryDtoImpl> get copyWith =>
      __$$TaskCategoryDtoImplCopyWithImpl<_$TaskCategoryDtoImpl>(this, _$identity);
}

abstract class _TaskCategoryDto extends TaskCategoryDto {
  const factory _TaskCategoryDto(
      {required final String name,
      required final String color,
      required final List<TaskDto> tasks}) = _$TaskCategoryDtoImpl;
  const _TaskCategoryDto._() : super._();

  @override
  String get name;
  @override
  String get color;
  @override
  List<TaskDto> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$TaskCategoryDtoImplCopyWith<_$TaskCategoryDtoImpl> get copyWith => throw _privateConstructorUsedError;
}
