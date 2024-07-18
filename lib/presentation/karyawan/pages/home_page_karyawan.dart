import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/presentation/karyawan/widgets/grid_card_product.dart';

import '../../superadmin/bloc/get_product/get_product_bloc.dart';

class HomePageKaryawan extends StatelessWidget {
  const HomePageKaryawan({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            child: Column(
              children: [
                // GridView dengan 4 kolom
                BlocBuilder<GetProductBloc, GetProductState>(
                  builder: (context, state) {
                    if (state is GetProductLoaded) {
                      final data = state.product;

                      if (data.isEmpty) {
                        return const Center(
                          child: Text(
                            'Belum ada data product',
                          ),
                        );
                      }
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // Jumlah kolom
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.70,
                        ),
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GridCardProduct(
                            product: data[index],
                          );
                        },
                      );
                    }

                    if (state is GetProductError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
