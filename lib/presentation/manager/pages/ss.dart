// import 'package:flutter/material.dart';
// import 'package:iconventory_web/core/components/custom_field.dart';

// import '../widgets/header.dart';

// class HomePageManager extends StatelessWidget {
//   const HomePageManager({super.key});

//   // Data source
//   List<Map<String, dynamic>> getData() {
//     return List.generate(
//       10,
//       (index) => {
//         'id': (index + 1).toString(),
//         'name':
//             'Product ${String.fromCharCode(65 + index)}', // Cycle through A, B, C
//         'price':
//             'Rp ${(index + 1) * 10000}', // Format price as Indonesian Rupiah
//         'stock': '${(index + 1) * 100}',
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final data = getData();

//     return SafeArea(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             const Header(
//               title: 'Home',
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               'All Products',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             ElevatedButton.icon(
//                               onPressed: () => showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return Dialog(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10.0),
//                                     ),
//                                     child: SizedBox(
//                                       width: 600,
//                                       child: SingleChildScrollView(
//                                         padding: const EdgeInsets.all(24.0),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             const Text(
//                                               'Add Product',
//                                               style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 16),
//                                             const CustomField.text(
//                                               label: 'Nama barang',
//                                             ),
//                                             const CustomField.text(
//                                               label: 'Kode barang',
//                                             ),
//                                             const CustomField.text(
//                                               label: 'Kategori',
//                                             ),
//                                             const CustomField.text(
//                                               label: 'Spesifikasi',
//                                             ),
//                                             const CustomField.text(
//                                               label: 'Tahun barang',
//                                             ),
//                                             const CustomField.text(
//                                               label: 'Stock barang',
//                                             ),
//                                             const SizedBox(
//                                               height: 20.0,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                               children: [
//                                                 TextButton(
//                                                   onPressed: () {
//                                                     Navigator.of(context).pop();
//                                                   },
//                                                   child: const SizedBox(
//                                                     width: 120,
//                                                     height: 40,
//                                                     child: Center(
//                                                         child: Text('Cancel')),
//                                                   ),
//                                                 ),
//                                                 const SizedBox(width: 8.0),
//                                                 ElevatedButton(
//                                                   onPressed: () {
//                                                     Navigator.of(context).pop();
//                                                   },
//                                                   child: const SizedBox(
//                                                     width: 120,
//                                                     height: 40,
//                                                     child: Center(
//                                                       child: Text('Add'),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 16,
//                                   horizontal: 16,
//                                 ),
//                               ),
//                               icon: const Icon(Icons.add),
//                               label: const Text('Add Product'),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: DataTable(
//                                 columnSpacing: 16,
//                                 columns: const [
//                                   DataColumn(label: Text('ID')),
//                                   DataColumn(label: Text('Name')),
//                                   DataColumn(label: Text('Price')),
//                                   DataColumn(label: Text('Stock')),
//                                 ],
//                                 rows: data
//                                     .map(
//                                       (item) => DataRow(cells: [
//                                         DataCell(Text(item['id']!)),
//                                         DataCell(Text(item['name']!)),
//                                         DataCell(Text(item['price']!)),
//                                         DataCell(Text(item['stock']!)),
//                                       ]),
//                                     )
//                                     .toList(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }