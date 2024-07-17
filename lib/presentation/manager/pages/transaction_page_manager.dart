import 'package:flutter/material.dart';

import '../widgets/header.dart';

class TransactionPageManager extends StatelessWidget {
  const TransactionPageManager({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Header(
              title: 'Transaction',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
