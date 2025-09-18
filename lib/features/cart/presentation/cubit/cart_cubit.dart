import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/delete_from_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/get_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/update_product_quantity.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._addToCart,
    this._getCart,
    this._updateProductQuantity,
    this._deleteFromCart,
  ) : super(CartInitial());

  final AddToCart _addToCart;
  final GetCart _getCart;
  final UpdateProductQuantity _updateProductQuantity;
  final DeleteFromCart _deleteFromCart;
  late Cart cart;

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoading());
    final result = await _addToCart(productId);
    result.fold(
      (failure) => emit(AddToCartError(failure.message)),
      (_) => emit(AddToCartSuccess()),
    );
  }

  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCart();
    result.fold((failure) => emit(GetCartError(failure.message)), (cart) {
      this.cart = cart;
      emit(GetCartSuccess());
    });
  }

  Future<void> updateProductQuantity(String productId, int quantity) async {
    emit(UpdateProductQuantityLoading());
    final result = await _updateProductQuantity(productId, quantity);
    result.fold(
      (failure) => emit(UpdateProductQuantityError(failure.message)),
      (cart) {
        this.cart = cart;
        emit(UpdateProductQuantitySuccess());
      },
    );
  }

  Future<void> deleteFromCart(String productId) async {
    emit(DeleteFromCartLoading());
    final result = await _deleteFromCart(productId);
    result.fold((failure) => emit(DeleteFromCartError(failure.message)), (
      cart,
    ) {
      this.cart = cart;
      emit(DeleteFromCartSuccess());
    });
  }
}
