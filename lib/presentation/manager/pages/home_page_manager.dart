import 'package:flutter/material.dart';

import '../widgets/header.dart';

class HomePageManager extends StatelessWidget {
  const HomePageManager({super.key});

  // Data source
  List<Map<String, String>> getData() {
    return List.generate(
      10,
      (index) => {
        'id': (index + 1).toString(),
        'name':
            'Product ${String.fromCharCode(65 + index)}', // Cycle through A, B, C
        'price':
            'Rp ${(index + 1) * 10000}', // Format price as Indonesian Rupiah
        'stock': '${(index + 1) * 100}',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = getData();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Header(
              title: 'Home',
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'All Products',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                              ),
                              icon: const Icon(Icons.add),
                              label: const Text('Add Product'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: DataTable(
                                columnSpacing: 16,
                                columns: const [
                                  DataColumn(label: Text('ID')),
                                  DataColumn(label: Text('Name')),
                                  DataColumn(label: Text('Price')),
                                  DataColumn(label: Text('Stock')),
                                ],
                                rows: data
                                    .map(
                                      (item) => DataRow(cells: [
                                        DataCell(Text(item['id']!)),
                                        DataCell(Text(item['name']!)),
                                        DataCell(Text(item['price']!)),
                                        DataCell(Text(item['stock']!)),
                                      ]),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
