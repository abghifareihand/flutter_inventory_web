import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/core/components/button_primary.dart';
import 'package:iconventory_web/core/components/custom_field.dart';
import 'package:iconventory_web/data/models/product_model.dart';
import 'package:iconventory_web/presentation/manager/bloc/add_product/add_product_bloc.dart';
import 'package:iconventory_web/presentation/manager/bloc/delete_product/delete_product_bloc.dart';

import '../../../core/components/alert_delete.dart';
import '../bloc/get_product/get_product_bloc.dart';

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Data Product',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () async {
                                await showDialog<bool>(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: SizedBox(
                                        width: 600,
                                        child: SingleChildScrollView(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Tambah Product',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              CustomField.text(
                                                controller: _nameController,
                                                label: 'Nama barang',
                                              ),
                                              CustomField.text(
                                                controller: _codeController,
                                                label: 'Kode barang',
                                              ),
                                              CustomField.text(
                                                controller: _categoryController,
                                                label: 'Kategori',
                                              ),
                                              CustomField.text(
                                                controller: _specificationController,
                                                label: 'Spesifikasi',
                                              ),
                                              CustomField.number(
                                                controller: _yearController,
                                                label: 'Tahun',
                                              ),
                                              CustomField.number(
                                                controller: _stockController,
                                                label: 'Stok',
                                              ),
                                              const SizedBox(height: 20.0),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  // Button cancel
                                                  SizedBox(
                                                    width: 120,
                                                    height: 40,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('Cancel'),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12.0),

                                                  // Button add product
                                                  BlocConsumer<AddProductBloc, AddProductState>(
                                                    listener: (context, state) {
                                                      if (state is AddProductLoaded) {
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text(state.message),
                                                            backgroundColor: Colors.green,
                                                          ),
                                                        );
                                                        _nameController.clear();
                                                        _codeController.clear();
                                                        _categoryController.clear();
                                                        _specificationController.clear();
                                                        _yearController.clear();
                                                        _stockController.clear();

                                                        context.read<GetProductBloc>().add(GetProduct());
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    builder: (context, state) {
                                                      return SizedBox(
                                                        width: 120,
                                                        height: 40,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            int stock = int.tryParse(_stockController.text) ?? 0;
                                                            bool status = stock > 0;
                                                            final product = ProductModel(
                                                              name: _nameController.text,
                                                              code: _codeController.text,
                                                              specification: _specificationController.text,
                                                              category: _categoryController.text,
                                                              year: int.tryParse(_yearController.text) ?? 0,
                                                              status: status,
                                                              stock: stock,
                                                            );
                                                            context.read<AddProductBloc>().add(AddProduct(product: product));
                                                          },
                                                          child: const Text('Add'),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                              ),
                              icon: const Icon(Icons.add),
                              label: const Text('Add Product'),
                            ),
                          ],
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
                                        DataColumn(
                                            label: Text(
                                          'Action',
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
                                              product.status ? 'ADA'.toUpperCase() : 'KOSONG'.toUpperCase(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: product.status ? Colors.green : Colors.red,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Row(
                                              children: [
                                                ButtonElevated(
                                                  color: Colors.green,
                                                  title: 'Edit',
                                                  onPressed: () {},
                                                ),
                                                const SizedBox(
                                                  width: 12.0,
                                                ),
                                                BlocListener<DeleteProductBloc, DeleteProductState>(
                                                  listener: (context, state) {
                                                    if (state is DeleteProductLoaded) {
                                                      context.read<GetProductBloc>().add(GetProduct());
                                                    }
                                                  },
                                                  child: ButtonElevated(
                                                    color: Colors.red,
                                                    title: 'Hapus',
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDelete(
                                                            message: 'Apa kamu yakin hapus produk ini?',
                                                            onPressed: () {
                                                              context.read<DeleteProductBloc>().add(DeleteProduct(productId: product.zproductId!));
                                                              Navigator.pop(context);
                                                            },
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
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
