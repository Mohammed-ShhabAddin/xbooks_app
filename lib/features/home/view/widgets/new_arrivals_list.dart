import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/custom_card_widget.dart';
import '../../../../core/widgets/shimmer_loading.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..emitGetNewArrivalsStates(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const ShimmerCardLoading(),
            success: (data) {
              return SizedBox(
                height: 270.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.data?.products.length,
                  itemBuilder: (context, index) {
                    var item = data.data?.products?[index];
                    return InkWell(
                      onTap: () {
                        //TODO:navigate to details screen
                      },
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: CustomCardWidget(
                            name: item.name,
                            category: item.category,
                            discount: item.discount,
                            imageUrl: item.image,
                            price: item.price,
                            priceAfterDiscount: item.priceAfterDiscount,
                          )),
                    );
                  },
                ),
              );
            },
            error: (error) {
              return Text('Error: $error');
            },
            orElse: () {
              return const Text('something get wrong');
            },
          );
        },
      ),
    );
  }
}
