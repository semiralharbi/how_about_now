import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_about_now/cubit/app_cubit.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  group('AppCubit', () {
    late AppCubit cubit;
    late MockAuthenticationRepository mockRepository;

    setUp(() {
      mockRepository = MockAuthenticationRepository();
      cubit = AppCubit(mockRepository);
    });

    test('initial state is loading', () {
      expect(cubit.state, const AppState.loading());
    });

    blocTest<AppCubit, AppState>(
      'emits [] when checkUser succeeds',
      build: () {
        when(mockRepository.checkUser()).thenAnswer((_) => Future.value());
        return cubit;
      },
      act: (cubit) => cubit.checkUser(),
      expect: () => <AppState>[],
    );

    blocTest<AppCubit, AppState>(
      'emits [] when checkUser throws an error',
      build: () {
        when(mockRepository.checkUser()).thenThrow(Exception('Error'));
        return cubit;
      },
      act: (cubit) => cubit.checkUser(),
      expect: () => <AppState>[],
    );
  });
}
