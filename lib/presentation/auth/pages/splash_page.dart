import 'package:flutter/material.dart';
import 'package:iconventory_web/presentation/karyawan/pages/main_page_karyawan.dart';
import 'package:iconventory_web/presentation/manager/pages/main_page_manager.dart';
import 'package:iconventory_web/presentation/superadmin/pages/main_page_admin.dart';

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
          builder: (context) {
            if (role == 'karyawan') {
              return const MainPageKaryawan();
            } else if (role == 'manager') {
              return const MainPageManager();
            } else {
              return const MainPageAdmin();
            }
          },
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img_splash.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 30.0,
              ),
              const SizedBox(
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
