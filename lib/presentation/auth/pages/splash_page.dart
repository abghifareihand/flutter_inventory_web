import 'package:flutter/material.dart';
import 'package:iconventory_web/presentation/karyawan/pages/main_page_karyawan.dart';
import 'package:iconventory_web/presentation/manager/pages/main_page_manager.dart';

import '../../../data/datasources/auth_local_datasource.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _checkLoginStatus();
    super.initState();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    bool isLoggedIn = await AuthLocalDatasource().isLogin();
    if (isLoggedIn) {
      String role = await AuthLocalDatasource().getRole();
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => role == 'karyawan'
              ? const MainPageKaryawan()
              : const MainPageManager(),
        ),
      );
    } else {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 400.0),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 48,
                width: 48,
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
