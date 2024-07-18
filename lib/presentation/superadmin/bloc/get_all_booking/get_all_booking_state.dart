part of 'get_all_booking_bloc.dart';

sealed class GetAllBookingState {}

final class GetAllBookingInitial extends GetAllBookingState {}

final class GetAllBookingLoading extends GetAllBookingState {}

final class GetAllBookingLoaded extends GetAllBookingState {
  final List<BookingModel> booking;
  GetAllBookingLoaded({required this.booking});
}

final class GetAllBookingError extends GetAllBookingState {
  final String message;
  GetAllBookingError({required this.message});
}
