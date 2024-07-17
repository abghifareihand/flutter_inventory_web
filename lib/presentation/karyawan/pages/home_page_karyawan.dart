import 'package:flutter/material.dart';
import 'package:iconventory_web/models/product_model.dart';
import 'package:iconventory_web/presentation/karyawan/widgets/banner_slider.dart';
import 'package:iconventory_web/presentation/karyawan/widgets/grid_card_product.dart';

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
                const BannerSlider(),
                const SizedBox(
                  height: 20.0,
                ),
                // GridView dengan 4 kolom
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Jumlah kolom
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.70,
                  ),
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GridCardProduct(
                      product: products[index],
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
