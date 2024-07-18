import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/data/datasources/admin_remote_datasource.dart';
import 'package:iconventory_web/data/models/product_model.dart';

part 'get_product_event.dart';
part 'get_product_state.dart';

class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
  GetProductBloc() : super(GetProductInitial()) {
    on<GetProduct>((event, emit) async {
      emit(GetProductLoading());
      final result = await ManagerRemoteDatasource().getProducts();
      result.fold(
        (error) => emit(GetProductError(message: error)),
        (data) => emit(GetProductLoaded(product: data)),
      );
    });
  }
}
