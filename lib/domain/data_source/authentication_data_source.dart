abstract class AuthenticationDataSource {
  Future<void> createAnonymousUser();

  String? getUserId();
}
