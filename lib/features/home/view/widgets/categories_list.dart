import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xbooks_store/core/theming/app_colors.dart';
import 'package:xbooks_store/core/theming/styles.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/shimmer_loading.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';

class CategoriesX extends StatelessWidget {
  const CategoriesX({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..emitGetAllCategoriesStates(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const ShimmerCategoryLoading(),
            success: (response) {
              return SizedBox(
                height: 120.h,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: response.data?.categories.length,
                  itemBuilder: (context, index) {
                    var item = response.data?.categories?[index];
                    return InkWell(
                      onTap: () {
                        //TODO:navigate to related category screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Stack(
                          children: [
                            Container(
                              width: 120.w,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/stack_of_books.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Container(
                              width: 120.w,
                              decoration: BoxDecoration(
                                  color: AppColors.darkBlue.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Center(
                                  child: Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyles.font18WhiteBold,
                                  ),
                                ))
                          ],
                        ),
                      ),
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
