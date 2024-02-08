import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:how_about_now/data/dto/task_dto.dart';
import 'package:how_about_now/domain/data_source/authentication_data_source.dart';
import 'package:how_about_now/domain/utils/exception.dart';
import 'package:how_about_now/domain/utils/shared_preferences_consts.dart';
import 'package:how_about_now/presentation/utils/enums/errors.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: AuthenticationDataSource)
class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  AuthenticationDataSourceImpl(this._firestore, this._sharedPreferences);

  final FirebaseFirestore _firestore;
  final SharedPreferences _sharedPreferences;

  @override
  Future<void> createAnonymousUser() async {
    try {
      final userId = const Uuid().v4();
      await _firestore.collection(userId).add(TaskDto.initial().toJson());
      await _sharedPreferences.setString(SharedPreferencesConsts.userIdKey, userId);
    } catch (e) {
      debugPrint(e.toString());
      throw ApiException(Errors.somethingWentWrong);
    }
  }

  @override
  String? getUserId() {
    return _sharedPreferences.getString(SharedPreferencesConsts.userIdKey);
  }
}
