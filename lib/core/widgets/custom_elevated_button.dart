import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double width;
  final double hight;
  final Function() onPressed;
  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.width,
      required this.hight});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, hight),
        backgroundColor: AppColors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0), //OR 10
        ),
      ),
      child: Text(text,
          style: const TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white)),
    );
  }
}
