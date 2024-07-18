part of 'delete_product_bloc.dart';

sealed class DeleteProductState {}

final class DeleteProductInitial extends DeleteProductState {}

final class DeleteProductLoading extends DeleteProductState {}

final class DeleteProductLoaded extends DeleteProductState {
  final String message;
  DeleteProductLoaded({required this.message});
}

final class DeleteProductError extends DeleteProductState {
  final String message;
  DeleteProductError({required this.message});
}
