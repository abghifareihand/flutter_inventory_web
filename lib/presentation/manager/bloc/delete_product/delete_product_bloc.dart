import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/datasources/manager_remote_datasource.dart';

part 'delete_product_event.dart';
part 'delete_product_state.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  DeleteProductBloc() : super(DeleteProductInitial()) {
    on<DeleteProduct>((event, emit) async {
      emit(DeleteProductLoading());
      final result = await ManagerRemoteDatasource().deleteProduct(event.productId);
      result.fold(
        (error) => emit(DeleteProductError(message: error)),
        (data) => emit(DeleteProductLoaded(message: data)),
      );
    });
  }
}
