part of 'get_booking_bloc.dart';

sealed class GetBookingState {}

final class GetBookingInitial extends GetBookingState {}

final class GetBookingLoading extends GetBookingState {}

final class GetBookingLoaded extends GetBookingState {
  final List<BookingModel> booking;
  GetBookingLoaded({required this.booking});
}

final class GetBookingError extends GetBookingState {
  final String message;
  GetBookingError({required this.message});
}
