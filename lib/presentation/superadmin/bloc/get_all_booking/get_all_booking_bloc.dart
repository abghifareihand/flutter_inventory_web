import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/data/datasources/admin_remote_datasource.dart';
import 'package:iconventory_web/data/models/booking_model.dart';

part 'get_all_booking_event.dart';
part 'get_all_booking_state.dart';

class GetAllBookingBloc extends Bloc<GetAllBookingEvent, GetAllBookingState> {
  GetAllBookingBloc() : super(GetAllBookingInitial()) {
    // on<GetAllBooking>((event, emit) async {
    //   emit(GetAllBookingLoading());
    //   final result = await ManagerRemoteDatasource().getAllBooking();
    //   result.fold(
    //     (error) => emit(GetAllBookingError(message: error)),
    //     (data) => emit(GetAllBookingLoaded(booking: data)),
    //   );
    // });

    on<GetAllBooking>((event, emit) async {
      emit(GetAllBookingLoading());
      try {
        final bookingStream = ManagerRemoteDatasource().getAllBooking();
        await emit.forEach<List<BookingModel>>(
          bookingStream,
          onData: (data) => GetAllBookingLoaded(booking: data),
          onError: (_, error) => GetAllBookingError(message: 'Error Get Booking'),
        );
      } catch (e) {
        emit(GetAllBookingError(message: e.toString()));
      }
    });
  }
}
