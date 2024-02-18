import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:how_about_now/domain/utils/timestamp_converter.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';
import 'package:uuid/uuid.dart';

part 'task_dto.freezed.dart';

part 'task_dto.g.dart';

@freezed
class TaskDto with _$TaskDto {
  const TaskDto._();

  const factory TaskDto({
    required String id,
    required String title,
    required String category,
    required String color,
    @TimestampConverter() required DateTime date,
    required bool isCompleted,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);

  factory TaskDto.initial() => TaskDto(
        title: 'Example task',
        category: 'General',
        color: AppColorsStrings.analogous700,
        date: DateTime.now(),
        isCompleted: false,
        id: const Uuid().v4(),
      );

  bool get hasGeneralCategory => category.toLowerCase() == 'general';
}
