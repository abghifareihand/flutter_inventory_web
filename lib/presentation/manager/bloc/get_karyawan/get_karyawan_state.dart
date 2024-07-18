part of 'get_karyawan_bloc.dart';

sealed class GetKaryawanState {}

final class GetKaryawanInitial extends GetKaryawanState {}

final class GetKaryawanLoading extends GetKaryawanState {}

final class GetKaryawanLoaded extends GetKaryawanState {
  final List<UserResponseModel> karyawan;
  GetKaryawanLoaded({required this.karyawan});
}

final class GetKaryawanError extends GetKaryawanState {
  final String message;
  GetKaryawanError({required this.message});
}
