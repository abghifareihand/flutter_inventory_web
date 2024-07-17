import 'package:flutter/material.dart';

class RoleTile extends StatelessWidget {
  final String selectedRole;
  final String roleName;
  final VoidCallback onTap;

  const RoleTile({
    super.key,
    required this.selectedRole,
    required this.roleName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          color: Colors.white,
          border: roleName == selectedRole
              ? Border.all(
                  color: Colors.blue,
                  width: 1,
                )
              : Border.all(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roleName.toUpperCase(),
                  ),
                  Text(
                    'Register sebagai $roleName',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Icon(
              roleName == selectedRole
                  ? Icons.radio_button_checked
                  : Icons.circle_outlined,
              color: roleName == selectedRole
                  ? Colors.blue
                  : Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
