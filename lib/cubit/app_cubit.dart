import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:how_about_now/domain/repositories/authentication_repository.dart';
import 'package:how_about_now/presentation/utils/enums/errors.dart';
import 'package:injectable/injectable.dart';

part 'app_state.dart';

part 'app_cubit.freezed.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit(this._authenticationRepository) : super(const AppState.loading()) {
    checkUser();
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> checkUser() async {
    try {
      await _authenticationRepository.checkUser();
    } catch (e, stack) {
      debugPrint('Failed to check user: $e, stack: $stack');
    }
  }
}
