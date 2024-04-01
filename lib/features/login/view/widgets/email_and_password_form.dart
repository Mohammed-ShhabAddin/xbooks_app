import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formekey,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.teal,
              width: 2.0,
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                lable: 'Email',
                hintText: 'Email',
                controller: context.read<LoginCubit>().emailController,
                prefixIcon: Icon(
                  size: 25.sp,
                  Icons.email,
                  color: AppColors.teal,
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return 'please enter valid Email';
                  }
                },
              ),
              verticalSpace(25),
              CustomTextFormField(
                lable: "Password",
                controller: context.read<LoginCubit>().passwordController,
                hintText: "password",
                isObscureText: isObscureText,
                prefixIcon: Icon(
                  size: 25.sp,
                  Icons.lock,
                  color: AppColors.teal,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(
                      color: AppColors.teal,
                      isObscureText ? Icons.visibility_off : Icons.visibility),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter valid Password';
                  }

                  if (!AppRegex.hasMinLength(passwordController.text)) {
                    return 'password must be more than 8 char';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                width: 400.w,
                hight: 50.h,
                onPressed: () {
                  validateThenDOLogin(context);
                },
                text: "Login",
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void validateThenDOLogin(BuildContext context) {
    if (context.read<LoginCubit>().formekey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
