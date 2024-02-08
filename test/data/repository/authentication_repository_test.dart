import 'package:how_about_now/data/repositories/authentication_repository_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks.mocks.dart';

void main() {
  late AuthenticationRepositoryImpl repository;
  late MockAuthenticationDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockAuthenticationDataSource();
    repository = AuthenticationRepositoryImpl(mockDataSource);
  });

  group('checkUser', () {
    test('should create anonymous user if user id is null', () async {
      when(mockDataSource.getUserId()).thenReturn(null);

      await repository.checkUser();

      verify(mockDataSource.createAnonymousUser());
    });

    test('should not create anonymous user if user id is not null', () async {
      when(mockDataSource.getUserId()).thenReturn('user123');

      await repository.checkUser();

      verifyNever(mockDataSource.createAnonymousUser());
    });

    test('should rethrow exception if an error occurs', () async {
      when(mockDataSource.getUserId()).thenThrow(Exception());

      expect(repository.checkUser, throwsException);
    });
  });
}
