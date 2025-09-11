import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/register_model.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest request);

  Future<LoginResponse> login(LoginRequest request);
}
