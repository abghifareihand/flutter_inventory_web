// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:goystore_app/core/components/button.dart';
// import 'package:goystore_app/core/constants/colors.dart';
// import 'package:goystore_app/core/constants/formatter.dart';
// import 'package:goystore_app/core/extensions/navigator.dart';
// import 'package:goystore_app/core/extensions/screen.dart';
// import 'package:goystore_app/presentation/cart/bloc/cart/cart_bloc.dart';
// import 'package:goystore_app/presentation/cart/widgets/cart_empty.dart';
// import 'package:goystore_app/presentation/cart/widgets/list_card_product.dart';

// import '../../checkout/pages/checkout_page.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor.primary,
//         centerTitle: true,
//         title: const Text('My Cart'),
//         titleTextStyle: whiteTextStyle.copyWith(
//           fontSize: 18,
//           fontWeight: medium,
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         children: [
//           BlocBuilder<CartBloc, CartState>(
//             builder: (context, state) {
//               return state.maybeWhen(
//                 orElse: () {
//                   return const Center(
//                     child: Text('Or Else'),
//                   );
//                 },
//                 loaded: (products) {
//                   if (products.isEmpty) {
//                     return const CartEmpty();
//                   }
//                   return ListView.separated(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: products.length,
//                     separatorBuilder: (BuildContext context, int index) {
//                       return Divider(
//                         height: 2,
//                         color: AppColor.grey300.withOpacity(0.5),
//                       );
//                     },
//                     itemBuilder: (context, index) {
//                       return ListCardProduct(
//                         productItems: products[index],
//                       );
//                     },
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
//         builder: (context, state) {
//           return state.maybeWhen(
//             orElse: () {
//               return const SizedBox.shrink();
//             },
//             loaded: (products) {
//               if (products.isEmpty) {
//                 return const SizedBox.shrink();
//               }
//               int totalPrice = 0;
//               for (var product in products) {
//                 totalPrice += product.quantity * product.product.price;
//               }
//               return Container(
//                 height: context.screenHeight * 0.15,
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 12,
//                   horizontal: 16,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Total Price',
//                           style: greyTextStyle.copyWith(
//                             fontSize: 16,
//                             fontWeight: medium,
//                           ),
//                         ),
//                         Text(
//                           priceFormat(totalPrice),
//                           style: blackTextStyle.copyWith(
//                             fontSize: 16,
//                             fontWeight: medium,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     Button.primary(
//                       onPressed: () {
//                         context.push(const CheckoutPage());
//                       },
//                       label: 'Continue to checkout',
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }