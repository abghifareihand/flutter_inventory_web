import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/data/datasources/manager_remote_datasource.dart';

part 'update_booking_event.dart';
part 'update_booking_state.dart';

class UpdateBookingBloc extends Bloc<UpdateBookingEvent, UpdateBookingState> {
  UpdateBookingBloc() : super(UpdateBookingInitial()) {
    on<UpdateBooking>((event, emit) async {
      emit(UpdateBookingLoading());
      final result = await ManagerRemoteDatasource().approveBooking(event.bookingId);
      result.fold(
        (error) => emit(UpdateBookingError(message: error)),
        (data) => emit(UpdateBookingLoaded(message: data)),
      );
    });
  }
}
