part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.loading() = _Loading;

  const factory AppState.loaded() = _Loaded;

  const factory AppState.error(Errors error) = _Error;
}
