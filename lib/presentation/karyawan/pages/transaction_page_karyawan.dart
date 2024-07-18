import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/presentation/karyawan/bloc/get_booking/get_booking_bloc.dart';

import '../widgets/booking_card.dart';

class TransactionPageKaryawan extends StatelessWidget {
  const TransactionPageKaryawan({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 300),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Booking Product List',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<GetBookingBloc, GetBookingState>(
                      builder: (context, state) {
                        if (state is GetBookingLoaded) {
                          final data = state.booking;

                          if (data.isEmpty) {
                            return const Center(
                              child: Text(
                                'Belum ada bookingan kamu',
                              ),
                            );
                          }
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 16);
                            },
                            itemBuilder: (context, index) {
                              return BookingCard(
                                booking: data[index],
                              );
                            },
                          );
                        }

                        if (state is GetBookingError) {
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
            ],
          ),
        ),
      ),
    );
  }
}
