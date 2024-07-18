import 'package:iconventory_web/data/models/product_model.dart';

class ProductCart {
  final ProductModel product;
  int quantity;

  ProductCart({
    required this.product,
    this.quantity = 0,
  });
}
