import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  final String userId;
  final String userName;
  final List<Map<String, dynamic>> products;
  final int totalProduct;
  final DateTime tanggalPinjam;
  final DateTime tanggalKembali;

  BookingModel({
    required this.userId,
    required this.userName,
    required this.products,
    required this.totalProduct,
    required this.tanggalPinjam,
    required this.tanggalKembali,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'products': products,
      'totalProduct': totalProduct,
      'tanggalPinjam': tanggalPinjam,
      'tanggalKembali': tanggalKembali,
    };
  }

  factory BookingModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return BookingModel(
      userId: snapshot['userId'],
      userName: snapshot['userName'],
      products: List<Map<String, dynamic>>.from(snapshot['products']),
      totalProduct: snapshot['totalProduct'],
      tanggalPinjam: (snapshot['tanggalPinjam'] as Timestamp).toDate(),
      tanggalKembali: (snapshot['tanggalKembali'] as Timestamp).toDate(),
    );
  }
}
