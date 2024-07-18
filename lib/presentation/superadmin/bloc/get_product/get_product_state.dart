part of 'get_product_bloc.dart';

sealed class GetProductState {}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}

final class GetProductLoaded extends GetProductState {
  final List<ProductModel> product;
  GetProductLoaded({required this.product});
}

final class GetProductError extends GetProductState {
  final String message;
  GetProductError({required this.message});
}
