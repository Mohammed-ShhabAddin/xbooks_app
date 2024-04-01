import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/signup_cubite.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  //
  bool hasMinLength = false;

  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    passwordConfirmationController =
        context.read<SignupCubit>().passwordConfirmationController;
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
      key: context.read<SignupCubit>().formkey,
      child: Column(
        children: [
          //#################### Name Field ####################
          CustomTextFormField(
            lable: 'Name',
            hintText: 'name',
            prefixIcon: Icon(
              size: 25.sp,
              Icons.person,
              color: AppColors.teal,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          const SizedBox(
            height: 15,
          ),

          //#################### Email Field ####################
          CustomTextFormField(
            lable: 'Email',
            controller: context.read<SignupCubit>().emailController,
            hintText: 'email',
            prefixIcon: Icon(
              size: 25.sp,
              Icons.email,
              color: AppColors.teal,
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),

          //#################### Password Field ####################
          CustomTextFormField(
            lable: 'Password',
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'password',
            prefixIcon: Icon(
              Icons.lock,
              size: 25.sp,
              color: AppColors.teal,
            ),
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(isPasswordObscureText
                  ? Icons.visibility_off
                  : Icons.visibility),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter valid Password';
              }
              if (!AppRegex.hasMinLength(passwordController.text)) {
                return "password must be more than 8 char";
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),

          //#################### Confirm Password Field ####################
          CustomTextFormField(
            lable: 'Confirm passowrd',
            controller:
                context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'rewrite passowrd',
            prefixIcon: Icon(
              size: 25.sp,
              Icons.lock,
              color: AppColors.teal,
            ),
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(isPasswordConfirmationObscureText
                  ? Icons.visibility_off
                  : Icons.visibility),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter valid Password';
              }
              if (value != passwordController.text) {
                return 'password not matched';
              }
            },
          ),

          const SizedBox(
            height: 25,
          ),

          //#################### REGISTER BUTTON ####################
          CustomElevatedButton(
            width: 400.w,
            hight: 50.h,
            onPressed: () {
              validateThenDoSignup(context);
            },
            text: "REGISTER",
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

//TODO: move it to bloc file
  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formkey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
