import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/errors/exception.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefsLocalDataSource implements AuthLocalDataSource {
  @override
  Future<String> getToken() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      return sharedPreferences.getString(CacheConstants.tokenKey)!;
    } catch (exception) {
      throw const LocalException(message: 'Failed To get Token');
    }
  }

  @override
  Future<void> savetoken(String token) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(CacheConstants.tokenKey, token);
    } catch (exception) {
      throw const LocalException(message: 'Failed To Save Exeption');
    }
  }
}
