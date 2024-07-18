import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/data/models/product_cart.dart';
import 'package:iconventory_web/presentation/karyawan/bloc/cart/cart_bloc.dart';

class ListProductCart extends StatelessWidget {
  final ProductCart productItems;

  const ListProductCart({
    super.key,
    required this.productItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          /// Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              height: 100,
              'assets/images/product_empty.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productItems.product.name} - ${productItems.product.code.toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  productItems.product.category,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    /// Price
                    Expanded(
                      child: Text(
                        'Tahun produk ${productItems.product.year}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    /// Qty
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<CartBloc>().add(RemoveFromCart(productItems: productItems));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              productItems.quantity == 1 ? Icons.delete : Icons.remove,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 32.0,
                          child: Center(
                            child: Text(
                              productItems.quantity.toString(),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<CartBloc>().add(AddToCart(productItems: productItems));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
