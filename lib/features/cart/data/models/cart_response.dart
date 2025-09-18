import 'package:ecommerce/features/cart/data/models/cart_model.dart';

class CartResponse {
  final String status;
  final int numOfCartItems;
  final CartModel cart;
  final String? cartId;

  const CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cart,
    required this.cartId,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
    status: json['status'] as String,
    numOfCartItems: json['numOfCartItems'] as int,
    cart: CartModel.fromJson(json['data'] as Map<String, dynamic>),
    cartId: json['cartId'] as String?,
  );
}
