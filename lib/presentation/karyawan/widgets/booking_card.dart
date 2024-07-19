import 'package:flutter/material.dart';
import 'package:iconventory_web/core/components/custom_dialog.dart';
import 'package:iconventory_web/core/constants/date_time_ext.dart';
import 'package:iconventory_web/data/models/booking_model.dart';
import 'package:iconventory_web/presentation/karyawan/pages/transaction_detail_page.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;
  const BookingCard({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: booking.isApproved
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionDetailPage(booking: booking),
                ),
              );
            }
          : () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return CustomDialog(
                      icon: Icons.dangerous_outlined,
                      message: 'Maaf belum di approve admin',
                      onPressed: () {
                        Navigator.pop(context);
                      });
                },
              );
            },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  booking.userName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  booking.isApproved ? 'Approved' : 'Not Approved',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: booking.isApproved ? Colors.green : Colors.red, // Kondisi warna teks
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Tanggal Peminjaman :',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              booking.tanggalPinjam.toFormattedDate(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Text(
              'Tanggal Kembalikan :',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              booking.tanggalKembali?.toFormattedDate() ?? '-',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Divider(),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'Total : ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${booking.totalProduct} barang',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
