part of 'update_booking_bloc.dart';

sealed class UpdateBookingEvent {}

class UpdateBooking extends UpdateBookingEvent {
  final String bookingId;

  UpdateBooking({required this.bookingId});
}
