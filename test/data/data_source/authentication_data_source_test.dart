import 'package:flutter_test/flutter_test.dart';
import 'package:how_about_now/data/data_source/authentication_data_source_impl.dart';
import 'package:how_about_now/domain/utils/exception.dart';
import 'package:how_about_now/domain/utils/shared_preferences_consts.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  late AuthenticationDataSourceImpl _authenticationDataSource;
  late MockFirebaseFirestore _firestore;
  late MockSharedPreferences _sharedPreferences;

  setUpAll(() {
    _firestore = MockFirebaseFirestore();
    _sharedPreferences = MockSharedPreferences();
    _authenticationDataSource = AuthenticationDataSourceImpl(_firestore, _sharedPreferences);
  });

  group('createAnonymousUser', () {
    test('should create anonymous user and save user id in SharedPreferences', () async {
      final mockCollectionReference = MockCollectionReference<Map<String, dynamic>>();
      when(_firestore.collection(any)).thenReturn(mockCollectionReference);
      when(mockCollectionReference.add(any)).thenAnswer((_) async => MockDocumentReference());
      when(_sharedPreferences.setString(any, any)).thenAnswer((_) => Future.value(true));

      await _authenticationDataSource.createAnonymousUser();

      verify(mockCollectionReference.add(any));
      verify(_sharedPreferences.setString(SharedPreferencesConsts.userIdKey, any));
    });

    test('should throw ApiException if an error occurs', () async {
      when(_firestore.collection(any)).thenThrow(Exception());

      expect(_authenticationDataSource.createAnonymousUser(), throwsA(const TypeMatcher<ApiException>()));
    });
  });

  group('getUserId', () {
    test('should return user id from SharedPreferences', () {
      const userId = 'user123';
      when(_sharedPreferences.getString(SharedPreferencesConsts.userIdKey)).thenReturn(userId);

      final result = _authenticationDataSource.getUserId();

      expect(result, equals(userId));
    });

    test('should throw ApiException if user id is not found', () {
      when(_sharedPreferences.getString(SharedPreferencesConsts.userIdKey)).thenReturn(null);

      expect(_authenticationDataSource.getUserId(), null);
    });
  });
}
