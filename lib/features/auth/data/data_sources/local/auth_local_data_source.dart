abstract class AuthLocalDataSource {
  Future<void> savetoken(String token);

  Future<String> getToken();
}
