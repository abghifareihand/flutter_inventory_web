import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/core/constants/date_time_ext.dart';

import '../bloc/get_all_booking/get_all_booking_bloc.dart';

class TransactionPageManager extends StatelessWidget {
  const TransactionPageManager({super.key});

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
                          'Data Booking',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<GetAllBookingBloc, GetAllBookingState>(
                          builder: (context, state) {
                            if (state is GetAllBookingLoaded) {
                              final data = state.booking;

                              if (data.isEmpty) {
                                return const Center(
                                  child: Text(
                                    'Belum ada data booking',
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
                                          'Username',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Total Product',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Tanggal Pinjam',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Tanggal Kembali',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                      ],
                                      rows: data.map((booking) {
                                        return DataRow(cells: [
                                          DataCell(
                                            Text(booking.userName),
                                          ),
                                          DataCell(
                                            Text('${booking.totalProduct} Barang'),
                                          ),
                                          DataCell(
                                            Text(booking.tanggalPinjam.toFormattedDate()),
                                          ),
                                          DataCell(
                                            Text(booking.tanggalKembali.toFormattedDate()),
                                          ),
                                        ]);
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              );
                            }

                            if (state is GetAllBookingError) {
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
