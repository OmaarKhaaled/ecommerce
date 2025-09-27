import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Register {
  final AuthRepository authRepository;

  Register({required this.authRepository});

  Future<Either<Failure, User>> call(RegisterRequest request) =>
      authRepository.register(request);
}
