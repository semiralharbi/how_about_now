// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDtoImpl _$$TaskDtoImplFromJson(Map<String, dynamic> json) => _$TaskDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      color: json['color'] as String,
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$TaskDtoImplToJson(_$TaskDtoImpl instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'color': instance.color,
      'date': const TimestampConverter().toJson(instance.date),
      'isCompleted': instance.isCompleted,
    };
