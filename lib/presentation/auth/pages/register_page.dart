import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/presentation/karyawan/pages/main_page_karyawan.dart';
import 'package:iconventory_web/presentation/manager/pages/main_page_manager.dart';

import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_field.dart';
import '../bloc/register/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  final String role;
  const RegisterPage({super.key, required this.role});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _buttonRegister() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap isi semua field'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      context.read<RegisterBloc>().add(Register(
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            role: widget.role,
          ));
    }
  }

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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomField.text(
                        controller: _nameController,
                        label: 'Name',
                      ),
                      CustomField.email(
                        controller: _emailController,
                        label: 'Email',
                      ),
                      CustomField.password(
                        controller: _passwordController,
                        label: 'Password',
                      ),
                      const SizedBox(height: 20),
                      BlocConsumer<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterLoaded) {
                            final user = state.user;

                            /// Jika role manager ke MainPageKaryawan
                            if (user.role == 'karyawan') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MainPageKaryawan(),
                                ),
                              );
                            }

                            /// Jika role manager ke MainPageManager
                            if (user.role == 'manager') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainPageManager(),
                                ),
                              );
                            }
                          }
                          if (state is RegisterError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return CustomButton(
                            onPressed: _buttonRegister,
                            text: 'Register',
                            isLoading: state is RegisterLoading,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
