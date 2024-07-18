import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/core/components/button_primary.dart';
import 'package:iconventory_web/core/components/custom_field.dart';
import 'package:iconventory_web/data/models/product_model.dart';
import 'package:iconventory_web/presentation/superadmin/bloc/add_product/add_product_bloc.dart';
import 'package:iconventory_web/presentation/superadmin/bloc/delete_product/delete_product_bloc.dart';

import '../../../core/components/alert_delete.dart';
import '../../superadmin/bloc/get_product/get_product_bloc.dart';

class HomePageManager extends StatefulWidget {
  const HomePageManager({super.key});

  @override
  State<HomePageManager> createState() => _HomePageManagerState();
}

class _HomePageManagerState extends State<HomePageManager> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _specificationController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Data Product',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
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
                              return Row(
                                children: [
                                  Expanded(
                                    child: DataTable(
                                      columnSpacing: 16,
                                      columns: const [
                                        DataColumn(
                                            label: Text(
                                          'Kode',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Nama',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Kategori',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Tahun',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Stock',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Status',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                      ],
                                      rows: data.map((product) {
                                        return DataRow(cells: [
                                          DataCell(
                                            Text(product.code),
                                          ),
                                          DataCell(
                                            Text(product.name),
                                          ),
                                          DataCell(
                                            Text(product.category),
                                          ),
                                          DataCell(
                                            Text(product.year.toString()),
                                          ),
                                          DataCell(
                                            Text(product.stock.toString()),
                                          ),
                                          DataCell(
                                            Text(
                                              product.status ? 'READY'.toUpperCase() : 'KOSONG'.toUpperCase(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: product.status ? Colors.green : Colors.red,
                                              ),
                                            ),
                                          ),
                                        ]);
                                      }).toList(),
                                    ),
                                  ),
                                ],
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
