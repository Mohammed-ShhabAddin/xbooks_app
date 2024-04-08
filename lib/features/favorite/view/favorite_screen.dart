import 'package:flutter/material.dart';
import 'package:xbooks_store/core/theming/app_colors.dart';
import 'package:xbooks_store/features/home/view/widgets/slider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.lightGray,
        child: const SliderX(),
      ),
    );
  }
}
