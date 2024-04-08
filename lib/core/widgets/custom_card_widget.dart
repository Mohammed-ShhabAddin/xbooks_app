import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xbooks_store/core/theming/app_colors.dart';
import 'package:xbooks_store/core/theming/styles.dart';

//THIS IS COMMON CARD WIDGET USED IN "Best Seller" and "New Arrivals" listview
class CustomCardWidget extends StatelessWidget {
  final String name;
  final String category;
  final String imageUrl;
  final int discount;
  final String price;
  final double priceAfterDiscount;

  const CustomCardWidget({
    super.key,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.discount,
    required this.price,
    required this.priceAfterDiscount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        color: AppColors.teal,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      ' $discount %',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              name.length > 13 ? '${name.substring(0, 12)}...' : name,
              style: TextStyles.font16BlackBold,
            ),
            const SizedBox(height: 4.0),
            Text(
                category.length > 13
                    ? '${category.substring(0, 12)}...'
                    : category,
                style: TextStyles.font16BlackBold),
            const SizedBox(height: 4.0),
            Text(
              ' $price L.E ',
              style: const TextStyle(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(height: 4.0),
            Text(
              ' ${priceAfterDiscount.toStringAsFixed(2)} L.E',
              style: TextStyles.font13BlueRegular,
            ),
          ],
        ),
      ),
    );
  }
}
