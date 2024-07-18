import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:iconventory_web/data/models/booking_model.dart';

import '../models/product_cart.dart';

class KaryawanRemoteDatasource {
  final bookingCollection = FirebaseFirestore.instance.collection('booking');

  Future<Either<String, String>> addBooking(
    List<ProductCart> products,
    String userId,
    String nameUser,
    int totalProduct,
  ) async {
    try {
      // Tanggal peminjaman (sekarang)
      DateTime tanggalPinjam = DateTime.now();
      // Tanggal kembali (5 hari setelah tanggal peminjaman)
      DateTime tanggalKembali = tanggalPinjam.add(const Duration(days: 5));

      Map<String, dynamic> bookingData = {
        'userId': userId,
        'userName': nameUser,
        'products': products.map((cart) => cart.toMap()).toList(),
        'totalProduct': totalProduct,
        'tanggalPinjam': Timestamp.fromDate(tanggalPinjam.toUtc()),
        'tanggalKembali': Timestamp.fromDate(tanggalKembali.toUtc()),
        'isApproved': false,
      };

      // Add data to Firestore and get document reference
      DocumentReference docRef = await bookingCollection.add(bookingData);
      String documentId = docRef.id;

      // Update the document with zbookingId
      await bookingCollection.doc(documentId).update({
        'zbookingId': documentId,
      });

      return const Right('Pemesanan berhasil');
    } catch (e) {
      return Left('Gagal melakukan pemesanan: $e');
    }
  }

  /// Future
  // Future<Either<String, List<BookingModel>>> getBookingsByUserId(String userId) async {
  //   try {
  //     final snapshot = await bookingCollection.where('userId', isEqualTo: userId).get();
  //     final bookings = snapshot.docs.map((doc) => BookingModel.fromDocumentSnapshot(doc)).toList();
  //     return Right(bookings);
  //   } catch (e) {
  //     return Left('Gagal mengambil booking: $e');
  //   }
  // }

  /// Stream
  Stream<List<BookingModel>> getBookingsByUserId(String userId) {
    try {
      return bookingCollection.where('userId', isEqualTo: userId).snapshots().map(
            (snapshot) => snapshot.docs.map((doc) => BookingModel.fromDocumentSnapshot(doc)).toList(),
          );
    } catch (e) {
      throw Exception('Gagal mengambil data booking: $e');
    }
  }
}
