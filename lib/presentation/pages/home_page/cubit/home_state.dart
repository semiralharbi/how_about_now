part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;

  const factory HomeState.loaded({
    required List<TaskDto> tasks,
    required List<TaskCategoryDto> categories,
  }) = _Loaded;

  const factory HomeState.error(Errors error) = _Error;
}
