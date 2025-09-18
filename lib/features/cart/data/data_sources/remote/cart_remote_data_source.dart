import 'package:ecommerce/features/cart/data/models/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart(String productId);

  Future<CartResponse> getCart();

  Future<CartResponse> updateProductQuantity(String productId, int quantity);

  Future<CartResponse> deleteFromCart(String productId);
}
