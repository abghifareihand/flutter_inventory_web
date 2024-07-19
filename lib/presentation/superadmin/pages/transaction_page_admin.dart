import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/core/components/button_primary.dart';
import 'package:iconventory_web/core/components/custom_date.dart';
import 'package:iconventory_web/core/constants/date_time_ext.dart';

import '../../superadmin/bloc/get_all_booking/get_all_booking_bloc.dart';
import '../../superadmin/bloc/update_booking/update_booking_bloc.dart';

class TransactionPageAdmin extends StatefulWidget {
  const TransactionPageAdmin({super.key});

  @override
  State<TransactionPageAdmin> createState() => _TransactionPageAdminState();
}

class _TransactionPageAdminState extends State<TransactionPageAdmin> {
  DateTime _selectedTanggalKembali = DateTime.now();
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
                                        DataColumn(
                                            label: Text(
                                          'Status',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                      ],
                                      rows: data.map((booking) {
                                        return DataRow(
                                          cells: [
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
                                              Text(booking.tanggalKembali?.toFormattedDate() ?? '-'),
                                            ),
                                            DataCell(
                                              BlocBuilder<UpdateBookingBloc, UpdateBookingState>(
                                                builder: (context, state) {
                                                  return ButtonElevated(
                                                    color: booking.isApproved ? Colors.green : Colors.red,
                                                    title: booking.isApproved ? 'Approved' : 'Not Approved',
                                                    // onPressed: booking.isApproved
                                                    //     ? () {}
                                                    //     : () {
                                                    //         context.read<UpdateBookingBloc>().add(
                                                    //               UpdateBooking(
                                                    //                 bookingId: booking.zbookingId!,
                                                    //                 tanggalKembali: DateTime.now().add(
                                                    //                   const Duration(days: 7),
                                                    //                 ),
                                                    //               ),
                                                    //             );
                                                    //       },

                                                    onPressed: booking.isApproved
                                                        ? () {}
                                                        : () async {
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
                                                                          const SizedBox(height: 20),
                                                                          CustomDate(
                                                                            label: 'Tanggal Kembalikan',
                                                                            initialDate: _selectedTanggalKembali.add(const Duration(days: 3)),
                                                                            onDateChanged: (newDate) {
                                                                              setState(() {
                                                                                _selectedTanggalKembali = newDate!;
                                                                              });
                                                                            },
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
                                                                              SizedBox(
                                                                                width: 120,
                                                                                height: 40,
                                                                                child: ElevatedButton(
                                                                                  onPressed: () {
                                                                                    context.read<UpdateBookingBloc>().add(
                                                                                          UpdateBooking(
                                                                                            bookingId: booking.zbookingId!,
                                                                                            tanggalKembali: _selectedTanggalKembali,
                                                                                          ),
                                                                                        );
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: const Text('Approve'),
                                                                                ),
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
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
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
