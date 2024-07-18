part of 'add_booking_bloc.dart';

sealed class AddBookingEvent {}

class AddBooking extends AddBookingEvent {
  final List<ProductCart> products;
  final String userId;
  final String userName;
  final int totalProduct;
  AddBooking({
    required this.products,
    required this.userId,
    required this.userName,
    required this.totalProduct,
  });
}
