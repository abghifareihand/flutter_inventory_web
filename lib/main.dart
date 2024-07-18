import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/presentation/auth/pages/splash_page.dart';
import 'package:iconventory_web/presentation/karyawan/bloc/cart/cart_bloc.dart';
import 'firebase_options.dart';
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'presentation/auth/bloc/logout/logout_bloc.dart';
import 'presentation/auth/bloc/register/register_bloc.dart';
import 'presentation/auth/bloc/user/user_bloc.dart';
import 'presentation/manager/bloc/add_product/add_product_bloc.dart';
import 'presentation/manager/bloc/delete_product/delete_product_bloc.dart';
import 'presentation/manager/bloc/get_karyawan/get_karyawan_bloc.dart';
import 'presentation/manager/bloc/get_product/get_product_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// AUTH
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),

        /// MANAGER
        BlocProvider(
          create: (context) => AddProductBloc(),
        ),
        BlocProvider(
          create: (context) => GetProductBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteProductBloc(),
        ),
        BlocProvider(
          create: (context) => GetKaryawanBloc(),
        ),

        /// KARYAWAN
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
