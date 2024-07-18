import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/data/datasources/karyawan_remote_datasource.dart';
import 'package:iconventory_web/data/models/booking_model.dart';

part 'get_booking_event.dart';
part 'get_booking_state.dart';

class GetBookingBloc extends Bloc<GetBookingEvent, GetBookingState> {
  GetBookingBloc() : super(GetBookingInitial()) {
    on<GetBookingByUser>((event, emit) async {
      emit(GetBookingLoading());
      final user = FirebaseAuth.instance.currentUser;
      final result = await KaryawanRemoteDatasource().getBookingsByUserId(user!.uid);
      result.fold(
        (error) => emit(GetBookingError(message: error)),
        (data) => emit(GetBookingLoaded(booking: data)),
      );
    });
  }
}
