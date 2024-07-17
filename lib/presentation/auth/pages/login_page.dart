import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/presentation/auth/pages/register_page.dart';
import 'package:iconventory_web/presentation/auth/pages/register_role_page.dart';

import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_field.dart';
import '../../karyawan/pages/main_page_karyawan.dart';
import '../../manager/pages/main_page_manager.dart';
import '../bloc/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomField.email(
                        controller: _emailController,
                        label: 'Email',
                      ),
                      CustomField.password(
                        controller: _passwordController,
                        label: 'Password',
                      ),
                      const SizedBox(height: 20),
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginLoaded) {
                            final user = state.user;
                            debugPrint('Rolemu : ${user.role}');

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
                          if (state is LoginError) {
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
                            onPressed: () {
                              context.read<LoginBloc>().add(Login(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ));
                            },
                            isLoading: state is LoginLoading,
                            text: 'Login',
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have an account? ',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterRolePage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Register',
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
