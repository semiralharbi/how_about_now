part of 'add_task_cubit.dart';

@freezed
class AddTaskState with _$AddTaskState {
  const factory AddTaskState.loading() = _Loading;

  const factory AddTaskState.loaded() = _Loaded;

  const factory AddTaskState.success() = _Success;

  const factory AddTaskState.error(Errors error) = _Error;
}
