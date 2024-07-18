import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/data/datasources/karyawan_remote_datasource.dart';

import '../../../../data/models/product_cart.dart';

part 'add_booking_event.dart';
part 'add_booking_state.dart';

class AddBookingBloc extends Bloc<AddBookingEvent, AddBookingState> {
  AddBookingBloc() : super(AddBookingInitial()) {
    on<AddBooking>((event, emit) async {
      emit(AddBookingLoading());
      final result = await KaryawanRemoteDatasource().addBooking(
        event.products,
        event.userId,
        event.userName,
        event.totalProduct,
      );
      result.fold(
        (error) => emit(AddBookingError(message: error)),
        (data) => emit(AddBookingLoaded(message: data)),
      );
    });
  }
}
