import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.network(
                imageUrl,
                height: 150,
              ),
              Positioned(
                top: 8.0,
                left: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: AppColors.teal,
                      borderRadius: BorderRadius.circular(5)),
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
          Text(category, style: TextStyles.font16BlackBold),
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
    );
  }
}
