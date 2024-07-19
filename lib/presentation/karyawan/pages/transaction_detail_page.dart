import 'package:flutter/material.dart';
import 'package:iconventory_web/core/constants/date_time_ext.dart';
import 'package:iconventory_web/data/models/booking_model.dart';

class TransactionDetailPage extends StatelessWidget {
  final BookingModel booking;

  const TransactionDetailPage({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail Booking'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxWidth: 950.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: booking.products.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 16);
                      },
                      itemBuilder: (context, index) {
                        final products = booking.products[index];
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/product_empty.jpg',
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products['product']['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  products['product']['category'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  '${products['quantity']} PCS',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nama',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          booking.userName,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        const Text(
                          'Tanggal Peminjaman',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          booking.tanggalPinjam.toFormattedDate(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        const Text(
                          'Tanggal Kembalikan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          booking.tanggalKembali?.toFormattedDate() ?? '-',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${booking.totalProduct} barang',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// ListView(
//         padding: const EdgeInsets.all(20),
//         children: [
//           Text(
//             'Detail Product',
//             style: blackTextStyle.copyWith(
//               fontWeight: medium,
//               fontSize: 16,
//             ),
//           ),
//           const SpaceHeight(16),
        
//         ],
//       ),