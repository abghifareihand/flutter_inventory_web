part of 'update_booking_bloc.dart';

sealed class UpdateBookingState {}

final class UpdateBookingInitial extends UpdateBookingState {}

final class UpdateBookingLoading extends UpdateBookingState {}

final class UpdateBookingLoaded extends UpdateBookingState {
  final String message;
  UpdateBookingLoaded({required this.message});
}

final class UpdateBookingError extends UpdateBookingState {
  final String message;
  UpdateBookingError({required this.message});
}
