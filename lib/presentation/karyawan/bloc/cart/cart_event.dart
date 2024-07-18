part of 'cart_bloc.dart';

sealed class CartEvent {}

class AddToCart extends CartEvent {
  final ProductCart productItems;
  AddToCart({
    required this.productItems,
  });
}

class RemoveFromCart extends CartEvent {
  final ProductCart productItems;
  RemoveFromCart({
    required this.productItems,
  });
}

class ResetCart extends CartEvent {}
