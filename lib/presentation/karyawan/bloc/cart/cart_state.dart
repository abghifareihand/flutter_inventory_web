part of 'cart_bloc.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<ProductCart> products;
  CartLoaded({required this.products});
}

final class CartError extends CartState {
  final String message;
  CartError({required this.message});
}
