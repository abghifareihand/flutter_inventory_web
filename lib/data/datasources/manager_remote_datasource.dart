import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:iconventory_web/data/models/booking_model.dart';
import 'package:iconventory_web/data/models/product_model.dart';

import '../models/user_response_model.dart';

class ManagerRemoteDatasource {
  final usersCollection = FirebaseFirestore.instance.collection('users');
  final productCollection = FirebaseFirestore.instance.collection('product');
  final bookingCollection = FirebaseFirestore.instance.collection('booking');

  /// Get Data Karyawan
  Future<Either<String, List<UserResponseModel>>> getKaryawan() async {
    try {
      final snapshot = await usersCollection.where('role', isEqualTo: 'karyawan').get();
      final users = snapshot.docs.map((doc) => UserResponseModel.fromDocumentSnapshot(doc)).toList();
      return Right(users);
    } catch (e) {
      return Left('Gagal mengambil data karyawan: $e');
    }
  }

  /// Add Product
  Future<Either<String, String>> addProduct(ProductModel product) async {
    try {
      DocumentReference docRef = await productCollection.add(product.toMap());
      String docId = docRef.id;
      await productCollection.doc(docId).update({
        'zproductId': docId,
      });
      return const Right('Tambah product berhasil');
    } catch (e) {
      return Left('Gagal menambahkan product: $e');
    }
  }

  /// Get Product
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final snapshot = await productCollection.get();
      final products = snapshot.docs.map((doc) => ProductModel.fromDocumentSnapshot(doc)).toList();
      return Right(products);
    } catch (e) {
      return Left('Gagal mengambil product: $e');
    }
  }

  /// Edit Product
  Future<Either<String, String>> editProduct(ProductModel product) async {
    try {
      await productCollection.doc(product.zproductId).update(product.toMap());
      return const Right('Edit product berhasil');
    } catch (e) {
      return Left('Gagal mengedit product: $e');
    }
  }

  /// Delete Product
  Future<Either<String, String>> deleteProduct(String productId) async {
    try {
      await productCollection.doc(productId).delete();
      return const Right('Hapus product berhasil');
    } catch (e) {
      return Left('Gagal menghapus product: $e');
    }
  }

  /// Get all bookings
  // Future<Either<String, List<BookingModel>>> getAllBooking() async {
  //   try {
  //     final snapshot = await bookingCollection.get();
  //     final bookings = snapshot.docs.map((doc) => BookingModel.fromDocumentSnapshot(doc)).toList();
  //     return Right(bookings);
  //   } catch (e) {
  //     return Left('Failed to retrieve bookings: $e');
  //   }
  // }

  Stream<List<BookingModel>> getAllBooking() {
    try {
      return bookingCollection.snapshots().map(
            (snapshot) => snapshot.docs.map((doc) => BookingModel.fromDocumentSnapshot(doc)).toList(),
          );
    } catch (e) {
      throw Exception('Gagal mengambil data keluhan pasien: $e');
    }
  }

  /// Update approved
  Future<Either<String, String>> approveBooking(String bookingId) async {
    try {
      await bookingCollection.doc(bookingId).update({
        'isApproved': true,
      });
      return const Right('Booking berhasil di-approve');
    } catch (e) {
      return Left('Gagal meng-approve booking: $e');
    }
  }
}
