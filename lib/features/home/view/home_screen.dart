import 'package:flutter/material.dart';
import 'package:xbooks_store/features/home/view/widgets/best_seller_list.dart';
import 'package:xbooks_store/features/home/view/widgets/new_arrivals_list.dart';
import 'package:xbooks_store/features/home/view/widgets/segment_header_title.dart';
import 'package:xbooks_store/features/home/view/widgets/slider.dart';

import 'widgets/categories_list.dart';
import 'widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const XAppBar(),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SliderX(),
                const SizedBox(
                  height: 10,
                ),
                HeaderTitle(
                  title: "Best Seller",
                  onPressed: () {},
                ),
                const BestSeller(),
                const SizedBox(
                  height: 10,
                ),
                HeaderTitle(
                  title: "Categories",
                  onPressed: () {},
                ),
                const CategoriesX(),
                const SizedBox(
                  height: 10,
                ),
                HeaderTitle(
                  title: "New Arrivals",
                  onPressed: () {},
                ),
                const NewArrivals()
              ],
            ),
          )
        ],
      ),
    );
  }
}
