import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/exception.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/romote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource ;
  final AuthLocalDataSource _authLocalDataSource ;

  AuthRepository(this._authRemoteDataSource, this._authLocalDataSource);

  Future<Either<Failure, UserModel>> register(RegisterRequest request) async {
    try {
      final response = await _authRemoteDataSource.register(request);
      await _authLocalDataSource.savetoken(response.token);
      return right(response.user);
    } on AppException catch (exception) {
      return left(Failure(exception.message));
    }
  }

  Future<Either<Failure, UserModel>> login(LoginRequest request) async {
    try {
      final response = await _authRemoteDataSource.login(request);
      await _authLocalDataSource.savetoken(response.token);
      return right(response.user);
    } on AppException catch (exception) {
      return left(Failure(exception.message));
    }
  }
}
