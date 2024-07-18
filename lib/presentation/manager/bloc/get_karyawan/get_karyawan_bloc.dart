import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/data/datasources/manager_remote_datasource.dart';
import 'package:iconventory_web/data/models/user_response_model.dart';

part 'get_karyawan_event.dart';
part 'get_karyawan_state.dart';

class GetKaryawanBloc extends Bloc<GetKaryawanEvent, GetKaryawanState> {
  GetKaryawanBloc() : super(GetKaryawanInitial()) {
    on<GetKaryawan>((event, emit) async {
      emit(GetKaryawanLoading());
      final result = await ManagerRemoteDatasource().getKaryawan();
      result.fold(
        (error) => emit(GetKaryawanError(message: error)),
        (data) => emit(GetKaryawanLoaded(karyawan: data)),
      );
    });
  }
}
