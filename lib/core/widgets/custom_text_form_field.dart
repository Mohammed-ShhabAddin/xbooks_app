import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final String lable;

  final TextEditingController? controller;
  final Function(String?) validator;

  const CustomTextFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      this.hintStyle,
      required this.hintText,
      this.isObscureText,
      this.suffixIcon,
      this.backgroundColor,
      this.controller,
      required this.validator,
      required this.lable,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        label: Text(
          lable,
          style: const TextStyle(color: AppColors.teal, fontSize: 18),
        ),
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
                horizontal: 20 /*.w*/, vertical: 18 /*.h*/),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.teal,
                width: 2.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                // color: ColorsManager.lighterGray,
                color: AppColors.greyTaupe,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.redErr,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.redErr,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintStyle: hintStyle // /?? TextStyles.font14GrayRegular
        ,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        //fillColor: backgroundColor  ?? ColorsManager.moreLightGray,
        filled: false,
      ),
      obscureText: isObscureText ?? false,
      // style: TextStyles.font14DarkBlueMedium,
      validator: (value) => validator(value),
    );
  }
}
