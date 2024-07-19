import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  final String? zbookingId;
  final String userId;
  final String userName;
  final List<Map<String, dynamic>> products;
  final int totalProduct;
  final DateTime tanggalPinjam;
  final DateTime? tanggalKembali;
  final bool isApproved;

  BookingModel({
    this.zbookingId,
    required this.userId,
    required this.userName,
    required this.products,
    required this.totalProduct,
    required this.tanggalPinjam,
    required this.tanggalKembali,
    this.isApproved = false,
  });

  factory BookingModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return BookingModel(
      zbookingId: snapshot.id,
      userId: snapshot['userId'],
      userName: snapshot['userName'],
      products: List<Map<String, dynamic>>.from(snapshot['products']),
      totalProduct: snapshot['totalProduct'],
      tanggalPinjam: (snapshot['tanggalPinjam'] as Timestamp).toDate(),
      tanggalKembali: snapshot['tanggalKembali'] != null ? (snapshot['tanggalKembali'] as Timestamp).toDate() : null,
      isApproved: snapshot['isApproved'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'products': products,
      'totalProduct': totalProduct,
      'tanggalPinjam': tanggalPinjam,
      'tanggalKembali': tanggalKembali,
      'isApproved': isApproved,
    };
  }
}
