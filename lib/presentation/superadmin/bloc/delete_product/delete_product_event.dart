part of 'delete_product_bloc.dart';

sealed class DeleteProductEvent {}

class DeleteProduct extends DeleteProductEvent {
  final String productId;
  DeleteProduct({
    required this.productId,
  });
}
