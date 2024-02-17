import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_about_now/domain/utils/exception.dart';
import 'package:how_about_now/presentation/pages/home_page/cubit/home_cubit.dart';
import 'package:how_about_now/presentation/utils/enums/errors.dart';
import 'package:mockito/mockito.dart';

import '../../../mocked_data.dart';
import '../../../mocks.mocks.dart';

void main() {
  group('HomeCubit', () {
    late HomeCubit cubit;
    late MockTasksRepository mockRepository;

    setUp(() {
      mockRepository = MockTasksRepository();
      cubit = HomeCubit(mockRepository);
    });

    blocTest<HomeCubit, HomeState>(
      'emits [loaded] when tasks successfully fetched',
      setUp: () {
        when(mockRepository.getTasks()).thenAnswer((_) async => tasksListV1);
        when(mockRepository.getTasksCategories()).thenAnswer((_) async => taskCategoriesList);
      },
      build: () => cubit,
      act: (cubit) => cubit.getTasks(),
      expect: () => <HomeState>[
        const HomeState.loading(),
        HomeState.loaded(tasks: tasksListV1, categories: taskCategoriesList),
      ],
      verify: (_) {
        verify(mockRepository.getTasks());
        verify(mockRepository.getTasksCategories());
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits [error] when getTasks throws an error',
      setUp: () => when(mockRepository.getTasks()).thenThrow(ApiException(Errors.somethingWentWrong)),
      build: () => cubit,
      act: (cubit) => cubit.getTasks(),
      expect: () => const [
        HomeState.loading(),
        HomeState.error(Errors.somethingWentWrong),
      ],
      verify: (_) {
        verify(mockRepository.getTasks());
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits [error] when getTasksCategories throws an error',
      setUp: () {
        when(mockRepository.getTasks()).thenAnswer((_) async => tasksListV1);
        when(mockRepository.getTasksCategories()).thenThrow(ApiException(Errors.somethingWentWrong));
      },
      build: () => cubit,
      act: (cubit) => cubit.getTasks(),
      expect: () => const [
        HomeState.loading(),
        HomeState.error(Errors.somethingWentWrong),
      ],
      verify: (_) {
        verify(mockRepository.getTasks());
        verify(mockRepository.getTasksCategories());
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
