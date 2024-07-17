// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconventory_web/pages/dashboard_page.dart';
// import 'package:iconventory_web/pages/transaction_page.dart';
// import 'package:iconventory_web/pages/account_page.dart';
// import 'package:iconventory_web/pages/main_page.dart';

// final GoRouter router = GoRouter(
//   initialLocation: '/dashboard',
//   routes: [
//     GoRoute(
//       path: '/dashboard',
//       builder: (context, state) => MainPage(selectedIndex: 0),
//     ),
//     GoRoute(
//       path: '/transaction',
//       builder: (context, state) => MainPage(selectedIndex: 1),
//     ),
//     GoRoute(
//       path: '/account',
//       builder: (context, state) => MainPage(selectedIndex: 2),
//     ),
//   ],
//   // Handle invalid routes
//   errorBuilder: (context, state) => Scaffold(
//     body: Center(child: Text('Page not found')),
//   ),
// );
