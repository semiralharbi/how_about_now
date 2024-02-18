import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:how_about_now/data/dto/task_dto.dart';
import 'package:how_about_now/domain/data_source/tasks_data_source.dart';
import 'package:how_about_now/domain/utils/exception.dart';
import 'package:how_about_now/domain/utils/shared_preferences_consts.dart';
import 'package:how_about_now/presentation/utils/enums/errors.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: TasksDataSource)
class TasksDataSourceImpl extends TasksDataSource {
  TasksDataSourceImpl(this._firestore, this._sharedPreferences);

  final FirebaseFirestore _firestore;
  final SharedPreferences _sharedPreferences;
  final String _categoryField = 'category';

  @override
  Future<void> createTask(TaskDto dto) async {
    try {
      final userId = _sharedPreferences.getString(SharedPreferencesConsts.userIdKey);
      await _firestore.collection(userId!).doc(dto.id).set(dto.toJson());
    } catch (e, stack) {
      debugPrint('There was an error while creating new task: $e, stack: $stack');
      throw ApiException(Errors.somethingWentWrong);
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      final userId = _sharedPreferences.getString(SharedPreferencesConsts.userIdKey);
      await _firestore.collection(userId!).doc(id).delete();
    } catch (e, stack) {
      debugPrint('There was an error while deleting a task: $e, stack: $stack');
      throw ApiException(Errors.somethingWentWrong);
    }
  }

  @override
  Future<List<TaskDto>> getTasks() async {
    try {
      final userId = _sharedPreferences.getString(SharedPreferencesConsts.userIdKey);
      final snapshot = await _firestore.collection(userId!).get();
      final tasks = snapshot.docs.map((e) => TaskDto.fromJson(e.data())).toList();
      return tasks;
    } catch (e, stack) {
      debugPrint('There was an error while fetching tasks: $e, stack: $stack');
      throw ApiException(Errors.somethingWentWrong);
    }
  }

  @override
  Future<List<TaskDto>> getTasksByCategory(String category) async {
    try {
      final userId = _sharedPreferences.getString(SharedPreferencesConsts.userIdKey);
      final snapshot = await _firestore.collection(userId!).where(_categoryField, isEqualTo: category).get();
      final tasks = snapshot.docs.map((e) => TaskDto.fromJson(e.data())).toList();
      return tasks;
    } catch (e, stack) {
      debugPrint('There was an error while fetching tasks by category: $e, stack: $stack');
      throw ApiException(Errors.somethingWentWrong);
    }
  }

  @override
  Future<void> completeTask({required String id, required bool isCompleted}) async {
    try {
      final userId = _sharedPreferences.getString(SharedPreferencesConsts.userIdKey);
      await _firestore.collection(userId!).doc(id).update({'isCompleted': isCompleted});
    } catch (e, stack) {
      debugPrint('There was an error while updating the task: $e, stack: $stack');
      throw ApiException(Errors.somethingWentWrong);
    }
  }
}
