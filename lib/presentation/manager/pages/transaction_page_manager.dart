import 'package:flutter/material.dart';

class TransactionPageManager extends StatelessWidget {
  const TransactionPageManager({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
