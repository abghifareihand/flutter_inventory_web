import 'package:flutter/material.dart';
import 'package:iconventory_web/presentation/karyawan/pages/home_page_karyawan.dart';
import 'package:iconventory_web/presentation/karyawan/pages/profile_page_karyawan.dart';
import 'package:iconventory_web/presentation/karyawan/pages/transaction_page_karyawan.dart';

class MainPageKaryawan extends StatefulWidget {
  const MainPageKaryawan({super.key});

  @override
  State<MainPageKaryawan> createState() => _MainPageKaryawanState();
}

class _MainPageKaryawanState extends State<MainPageKaryawan> {
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
      backgroundColor: Colors.grey.withOpacity(0.1),
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
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6, right: 6),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.black,
                      ),
                    ),
                    const Positioned(
                      top: 3,
                      right: 3,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          '10',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                const Text(
                  'Karyawan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
              ],
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
