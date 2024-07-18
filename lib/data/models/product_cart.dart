import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iconventory_web/data/models/product_model.dart';

class ProductCart {
  final ProductModel product;
  int quantity;

  ProductCart({
    required this.product,
    this.quantity = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(), // Mengonversi ProductModel ke Map
      'quantity': quantity,
    };
  }

  factory ProductCart.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return ProductCart(
      product: ProductModel.fromDocumentSnapshot(snapshot['product']), // Mengonversi Map ke ProductModel
      quantity: snapshot['quantity'],
    );
  }
}
