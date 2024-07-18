import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/data/models/product_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoaded(products: [])) {
    on<AddToCart>((event, emit) {
      final currentState = state as CartLoaded;
      final index = currentState.products.indexWhere((element) => element.product.zproductId == event.productItems.product.zproductId);
      if (index >= 0) {
        currentState.products[index].quantity += 1;
        emit(CartLoading());
        emit(CartLoaded(products: currentState.products));
      } else {
        emit(CartLoaded(products: [...currentState.products, event.productItems]));
      }
    });

    on<RemoveFromCart>((event, emit) {
      final currentState = state as CartLoaded;
      final index = currentState.products.indexWhere((element) => element.product.zproductId == event.productItems.product.zproductId);

      if (index >= 0) {
        if (currentState.products[index].quantity > 1) {
          // Kurangi jumlah produk jika jumlahnya lebih dari 1
          currentState.products[index].quantity -= 1;
          emit(CartLoading());
          emit(CartLoaded(products: [...currentState.products]));
        } else {
          // Jika jumlah produk sudah 1, maka hapus produk dari keranjang
          final updateCart = [...currentState.products];
          updateCart.removeWhere((productQuantity) => productQuantity == event.productItems);

          // Mengeluarkan state baru dengan produk yang telah dihapus
          emit(CartLoaded(products: updateCart));
        }
      }
    });
  }
}
