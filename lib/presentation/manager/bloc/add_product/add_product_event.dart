part of 'add_product_bloc.dart';

sealed class AddProductEvent {}

class AddProduct extends AddProductEvent {
  final ProductModel product;
  AddProduct({
    required this.product,
  });
}
