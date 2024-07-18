part of 'add_booking_bloc.dart';

sealed class AddBookingState {}

final class AddBookingInitial extends AddBookingState {}

final class AddBookingLoading extends AddBookingState {}

final class AddBookingLoaded extends AddBookingState {
  final String message;
  AddBookingLoaded({required this.message});
}

final class AddBookingError extends AddBookingState {
  final String message;
  AddBookingError({required this.message});
}
