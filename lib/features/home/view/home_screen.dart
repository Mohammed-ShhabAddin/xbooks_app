import 'package:flutter/material.dart';
import 'package:xbooks_store/core/theming/styles.dart';
import 'package:xbooks_store/features/home/view/widgets/best_seller_listview.dart';
import 'package:xbooks_store/features/home/view/widgets/slider.dart';

import 'widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            const SliderX(),
            const SizedBox(
              height: 10,
            ),

            //TODO:extract all rows to separated widget
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Best Seller ",
                  style: TextStyles.font20BlackBold,
                ),
                const Icon(
                  Icons.keyboard_arrow_right_sharp,
                  size: 40,
                )
              ],
            ),
            const BestSeller(),
          ],
        ),
      ),
    );
  }
}
