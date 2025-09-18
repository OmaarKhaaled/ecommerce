import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateProductQuantity {
  final CartRepository _cartRepository;

  const UpdateProductQuantity(this._cartRepository);

  Future<Either<Failure, Cart>> call(String productId, int quantity) =>
      _cartRepository.updateProductQuantity(productId, quantity);
}
