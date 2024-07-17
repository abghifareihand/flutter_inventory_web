import 'package:flutter/material.dart';

import '../widgets/header.dart';

class ProfilePageManager extends StatelessWidget {
  const ProfilePageManager({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Header(
              title: 'Profile',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
