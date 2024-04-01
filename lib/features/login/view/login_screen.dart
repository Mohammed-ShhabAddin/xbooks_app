import 'package:flutter/material.dart';
import 'package:xbooks_store/features/login/view/widgets/dont_have_account_text.dart';

import '../../../core/theming/app_colors.dart';
import 'widgets/bloc_listener.dart';
import 'widgets/email_and_password_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/logo-x.png', height: 120),
                const Text(
                  "Login now!",
                  style: TextStyle(
                      color: AppColors.teal,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const DontHaveAccountText(),
                const SizedBox(
                  height: 10,
                ),
                const EmailAndPassword(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
