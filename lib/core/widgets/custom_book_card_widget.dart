//THIS IS COMMON CARD WIDGET USED IN "Best Seller" and "New Arrivals" listview

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xbooks_store/core/theming/styles.dart';

import '../theming/app_colors.dart';

class CustomBooksCardWidget extends StatelessWidget {
  final String name;
  final String category;
  final String imageUrl;
  final int discount;
  final String price;
  final double priceAfterDiscount;

  const CustomBooksCardWidget({
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
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6),
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: AppColors.teal)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageUrl,
                      height: 150.h,
                      width: 120.w,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          height: 150.h,
                          "assets/images/stack_of_books.png",
                          fit: BoxFit.cover,
                        );
                      },
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
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 7,
                ),
                Text(
                  name.length > 20 ? '${name.substring(0, 20)}...' : name,
                  style: TextStyles.font16BlackBold,
                ),
                const SizedBox(height: 4.0),
                Text(
                    category.length > 25
                        ? '${category.substring(0, 25)}...'
                        : category,
                    style: TextStyles.font16BlackBold),
                const SizedBox(height: 4.0),
                Text(
                  ' $price L.E ',
                  style:
                      const TextStyle(decoration: TextDecoration.lineThrough),
                ),
                const SizedBox(height: 4.0),
                Text(
                  ' ${priceAfterDiscount.toStringAsFixed(2)} L.E',
                  style: TextStyles.font13BlueRegular,
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {
                    //for test only
                    Fluttertoast.showToast(
                        msg: "This is Center Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  icon: const Icon(Icons.add_shopping_cart),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
