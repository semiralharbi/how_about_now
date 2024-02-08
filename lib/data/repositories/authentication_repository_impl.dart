import 'package:flutter/cupertino.dart';
import 'package:how_about_now/domain/data_source/authentication_data_source.dart';
import 'package:how_about_now/domain/repositories/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl(this._authenticationDataSource);

  final AuthenticationDataSource _authenticationDataSource;

  @override
  Future<void> checkUser() async {
    try {
      final user = _authenticationDataSource.getUserId();
      if (user == null) {
        await _authenticationDataSource.createAnonymousUser();
      } else {
        debugPrint('Found user ID: $user');
      }
    } catch (e) {
      rethrow;
    }
  }
}
