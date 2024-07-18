import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/presentation/karyawan/pages/home_page_karyawan.dart';
import 'package:iconventory_web/presentation/karyawan/pages/profile_page_karyawan.dart';
import 'package:iconventory_web/presentation/karyawan/pages/transaction_page_karyawan.dart';

import '../../auth/bloc/user/user_bloc.dart';
import '../../manager/bloc/get_product/get_product_bloc.dart';

class MainPageKaryawan extends StatefulWidget {
  const MainPageKaryawan({super.key});

  @override
  State<MainPageKaryawan> createState() => _MainPageKaryawanState();
}

class _MainPageKaryawanState extends State<MainPageKaryawan> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetUser());
    context.read<GetProductBloc>().add(GetProduct());
    super.initState();
  }

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePageKaryawan(),
    const TransactionPageKaryawan(),
    const ProfilePageKaryawan(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'ICONVENTORY',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopNavbar(
                  title: 'Home',
                  onTap: () => _onItemTapped(0),
                  isSelected: _selectedIndex == 0,
                ),
                TopNavbar(
                  title: 'Transaction',
                  onTap: () => _onItemTapped(1),
                  isSelected: _selectedIndex == 1,
                ),
                TopNavbar(
                  title: 'Profile',
                  onTap: () => _onItemTapped(2),
                  isSelected: _selectedIndex == 2,
                ),
              ],
            ),
            Text(
              'Karyawan',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class TopNavbar extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  const TopNavbar({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.transparent,
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
