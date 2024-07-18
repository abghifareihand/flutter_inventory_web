import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/core/components/button_primary.dart';
import 'package:iconventory_web/core/components/custom_button.dart';
import 'package:iconventory_web/presentation/karyawan/widgets/list_product_cart.dart';

import '../bloc/cart/cart_bloc.dart';

class CartPageKaryawan extends StatelessWidget {
  const CartPageKaryawan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxWidth: 950.0),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  final data = state.products;

                  if (data.isEmpty) {
                    return const Center(
                      child: Text(
                        'Belum ada data product cart',
                      ),
                    );
                  }
                  return Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              height: 2,
                              color: Colors.grey.withOpacity(0.2),
                            );
                          },
                          itemBuilder: (context, index) {
                            return ListProductCart(
                              productItems: data[index],
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total peminjaman',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              BlocBuilder<CartBloc, CartState>(
                                builder: (context, state) {
                                  if (state is CartLoaded) {
                                    final data = state.products;

                                    int totalQuantity = 0;
                                    for (var cart in data) {
                                      totalQuantity += cart.quantity;
                                    }
                                    if (totalQuantity == 0) {
                                      return const SizedBox.shrink();
                                    }
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Total barang',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          '$totalQuantity PCS',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    );
                                  }

                                  return const SizedBox();
                                },
                              ),
                              const SizedBox(height: 12),
                              Divider(
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              const SizedBox(height: 24),
                              CustomButton(
                                onPressed: () {},
                                text: 'Book Now',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }

                if (state is CartError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
