import 'package:flutter/material.dart';
import 'package:iconventory_web/presentation/auth/pages/register_page.dart';

import '../../../core/components/custom_button.dart';
import '../widgets/role_tile.dart';

class RegisterRolePage extends StatefulWidget {
  const RegisterRolePage({
    super.key,
  });

  @override
  State<RegisterRolePage> createState() => _RegisterRolePageState();
}

class _RegisterRolePageState extends State<RegisterRolePage> {
  String _selectedRole = 'karyawan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
            constraints: const BoxConstraints(maxWidth: 400.0),
            child: Column(
              children: [
                const Text(
                  'Select Role',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                RoleTile(
                  selectedRole: _selectedRole,
                  roleName: 'karyawan',
                  onTap: () {
                    setState(() {
                      _selectedRole = 'karyawan';
                    });
                  },
                ),
                const SizedBox(height: 16),
                RoleTile(
                  selectedRole: _selectedRole,
                  roleName: 'manager',
                  onTap: () {
                    setState(() {
                      _selectedRole = 'manager';
                    });
                  },
                ),
                const SizedBox(height: 16),
                RoleTile(
                  selectedRole: _selectedRole,
                  roleName: 'admin',
                  onTap: () {
                    setState(() {
                      _selectedRole = 'admin';
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(
                          role: _selectedRole,
                        ),
                      ),
                    );
                  },
                  text: 'Continue',
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
