import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class CustomProfileFormField extends StatelessWidget {
  final String name;
  final TextEditingController? nameController;
  final String email;
  final TextEditingController? emailController;

  final String? phone;
  final TextEditingController? phoneController;
  final String? city;
  final TextEditingController? cityController;
  final String? address;
  final TextEditingController? addressController;
  final bool? readOnly;

  const CustomProfileFormField(
      {super.key,
      required this.name,
      required this.email,
      this.phone,
      this.city,
      this.address,
      this.readOnly,
      this.nameController,
      this.phoneController,
      this.cityController,
      this.addressController,
      this.emailController});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width * 0.90,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
            //u can remove border
            border: Border.all(width: 0.5, color: Colors.black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textFormFiled(
                "name", Icons.person, name, readOnly!, nameController!),
            textFormFiled(
                "email", Icons.email, email, readOnly!, emailController!),
            textFormFiled(
                "phone", Icons.phone, phone!, readOnly!, phoneController!),
            textFormFiled("city", Icons.location_city_outlined, city!,
                readOnly!, cityController!),
            textFormFiled("address", Icons.location_on, address!, readOnly!,
                addressController!),
          ],
        ),
      ),
    );
  }
}

Widget textFormFiled(String label, IconData prefixIcon, String hintText,
    bool readOnly, TextEditingController? controller) {
  return Container(
    margin: const EdgeInsets.all(5),
    child: TextFormField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: AppColors.teal,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 45.w),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.teal,
          size: 25.sp,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greyTaupe,
            width: 1.2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greyTaupe,
            width: 1.2,
          ),
        ),
      ),
    ),
  );
}
