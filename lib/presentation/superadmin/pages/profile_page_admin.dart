import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconventory_web/core/components/custom_field.dart';

import '../../../core/components/custom_button.dart';
import '../../auth/bloc/logout/logout_bloc.dart';
import '../../auth/bloc/user/user_bloc.dart';
import '../../auth/pages/login_page.dart';

class ProfilePageAdmin extends StatelessWidget {
  const ProfilePageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
                        const Text(
                          'My Profile',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                            if (state is UserLoaded) {
                              final user = state.user;
                              return Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: Image.asset(
                                        'assets/images/img_user.png',
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    CustomField.text(
                                      label: 'Name',
                                      readOnly: true,
                                      controller: TextEditingController(
                                        text: user.name,
                                      ),
                                    ),
                                    CustomField.text(
                                      label: 'Email',
                                      readOnly: true,
                                      controller: TextEditingController(
                                        text: user.email,
                                      ),
                                    ),
                                    CustomField.text(
                                      label: 'Role',
                                      readOnly: true,
                                      controller: TextEditingController(
                                        text: user.role,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    BlocConsumer<LogoutBloc, LogoutState>(
                                      listener: (context, state) {
                                        if (state is LogoutLoaded) {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const LoginPage(),
                                              ),
                                              (route) => false);
                                        }

                                        if (state is LogoutError) {
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
                                            context.read<LogoutBloc>().add(Logout());
                                          },
                                          text: 'Logout',
                                          isLoading: state is LogoutLoading,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                            return Container();
                          },
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
