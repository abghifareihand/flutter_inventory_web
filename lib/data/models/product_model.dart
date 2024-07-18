import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? zproductId;
  final String name;
  final String code;
  final String specification;
  final String category;
  final int year;
  final bool status;
  final int stock;

  ProductModel({
    this.zproductId,
    required this.name,
    required this.code,
    required this.specification,
    required this.category,
    required this.year,
    required this.status,
    required this.stock,
  });

  factory ProductModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return ProductModel(
      zproductId: snapshot.id,
      name: snapshot['name'],
      code: snapshot['code'],
      specification: snapshot['specification'],
      category: snapshot['category'],
      year: snapshot['year'],
      status: snapshot['status'],
      stock: snapshot['stock'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'specification': specification,
      'category': category,
      'year': year,
      'status': status,
      'stock': stock,
    };
  }
}
