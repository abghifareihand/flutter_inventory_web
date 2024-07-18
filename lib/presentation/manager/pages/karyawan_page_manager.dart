import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/get_karyawan/get_karyawan_bloc.dart';

class KaryawanPageManager extends StatelessWidget {
  const KaryawanPageManager({super.key});

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
                          'Data Karyawan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<GetKaryawanBloc, GetKaryawanState>(
                          builder: (context, state) {
                            if (state is GetKaryawanLoaded) {
                              final data = state.karyawan;

                              if (data.isEmpty) {
                                return const Center(
                                  child: Text(
                                    'Belum ada data karyawan',
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
                                          'Nama',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Email',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Role',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                      ],
                                      rows: data.map((product) {
                                        return DataRow(cells: [
                                          DataCell(Text(product.name)),
                                          DataCell(Text(product.email)),
                                          DataCell(Text(product.role)),
                                        ]);
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              );
                            }

                            if (state is GetKaryawanError) {
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
