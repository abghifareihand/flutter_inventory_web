import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/data/datasources/admin_remote_datasource.dart';

part 'update_booking_event.dart';
part 'update_booking_state.dart';

class UpdateBookingBloc extends Bloc<UpdateBookingEvent, UpdateBookingState> {
  UpdateBookingBloc() : super(UpdateBookingInitial()) {
    on<UpdateBooking>((event, emit) async {
      emit(UpdateBookingLoading());
      final result = await ManagerRemoteDatasource().approveBooking(
        event.bookingId,
        event.tanggalKembali,
      );
      result.fold(
        (error) => emit(UpdateBookingError(message: error)),
        (data) => emit(UpdateBookingLoaded(message: data)),
      );
    });
  }
}
