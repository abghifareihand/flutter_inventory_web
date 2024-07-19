part of 'update_booking_bloc.dart';

sealed class UpdateBookingEvent {}

class UpdateBooking extends UpdateBookingEvent {
  final String bookingId;
  final DateTime tanggalKembali;

  UpdateBooking({required this.bookingId, required this.tanggalKembali});
}
