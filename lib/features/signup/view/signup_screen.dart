import 'package:flutter/material.dart';
import 'package:xbooks_store/core/theming/app_colors.dart';

import 'widgets/already_have_account.dart';
import 'widgets/signup_bloc_listener.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                "Join Us!",
                style: TextStyle(
                    color: AppColors.teal,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const AlreadyHaveAccountText(),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.teal,
                    width: 2.0,
                  ),
                ),
                child: const SignupForm(),
              ),
              const SignupBlocListener()
            ],
          ),
        ),
      )),
    );
  }
}
