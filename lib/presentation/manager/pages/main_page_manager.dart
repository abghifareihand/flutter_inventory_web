import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconventory_web/presentation/auth/bloc/user/user_bloc.dart';
import 'package:iconventory_web/presentation/superadmin/bloc/get_all_booking/get_all_booking_bloc.dart';
import 'package:iconventory_web/presentation/superadmin/bloc/get_karyawan/get_karyawan_bloc.dart';
import 'package:iconventory_web/presentation/superadmin/bloc/get_product/get_product_bloc.dart';
import 'package:iconventory_web/presentation/manager/pages/home_page_manager.dart';
import 'package:iconventory_web/presentation/manager/pages/profile_page_manager.dart';
import 'package:iconventory_web/presentation/manager/pages/transaction_page_manager.dart';

class MainPageManager extends StatefulWidget {
  const MainPageManager({super.key});

  @override
  State<MainPageManager> createState() => _MainPageManagerState();
}

class _MainPageManagerState extends State<MainPageManager> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetUser());
    context.read<GetProductBloc>().add(GetProduct());
    context.read<GetKaryawanBloc>().add(GetKaryawan());
    context.read<GetAllBookingBloc>().add(GetAllBooking());
    super.initState();
  }

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePageManager(),
    const TransactionPageManager(),
    const ProfilePageManager(),
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
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sidebar
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
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
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'MANAGER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DrawerListTile(
                      title: 'Home',
                      svgSrc: 'assets/icons/ic_home.svg',
                      onTap: () => _onItemTapped(0),
                      isSelected: _selectedIndex == 0, // Pass selectedIndex
                    ),
                    DrawerListTile(
                      title: 'Transaction',
                      svgSrc: 'assets/icons/ic_trans.svg',
                      onTap: () => _onItemTapped(1),
                      isSelected: _selectedIndex == 1, // Pass selectedIndex
                    ),
                    DrawerListTile(
                      title: 'Account',
                      svgSrc: 'assets/icons/ic_user.svg',
                      onTap: () => _onItemTapped(2),
                      isSelected: _selectedIndex == 2, // Pass selectedIndex
                    ),
                    // Add other menu items here if needed
                  ],
                ),
              ),
            ),
            // Main content area
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    child: _pages[_selectedIndex],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final String svgSrc;
  final VoidCallback onTap;
  final bool isSelected;

  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: onTap,
        leading: SvgPicture.asset(
          svgSrc,
          colorFilter: ColorFilter.mode(
            isSelected ? Colors.white : Colors.black,
            BlendMode.srcIn,
          ),
          height: 20,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
