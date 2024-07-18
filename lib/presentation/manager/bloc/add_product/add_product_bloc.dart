import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/data/datasources/manager_remote_datasource.dart';

import '../../../../data/models/product_model.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitial()) {
    on<AddProduct>((event, emit) async {
      emit(AddProductLoading());
      final result = await ManagerRemoteDatasource().addProduct(event.product);
      result.fold(
        (error) => emit(AddProductError(message: error)),
        (data) => emit(AddProductLoaded(message: data)),
      );
    });
  }
}
