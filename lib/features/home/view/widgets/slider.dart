import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xbooks_store/features/home/logic/home_cubit.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../logic/home_state.dart';

class SliderX extends StatelessWidget {
  const SliderX({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..emitGetSliderDataStates(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) {
              return CarouselSlider.builder(
                itemCount: data.data?.sliders?.length ?? 0,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      data.data!.sliders![itemIndex].image ?? "m",
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: .8,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayCurve: Curves.linear,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.1,
                  onPageChanged: (index, reason) {},
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


/** if (state is Loading) {
          //TODO:change it to shimmer
          return const CircularProgressIndicator();
        } else if (state is Error) {
          return Text('Error: ${state.error}');
        } else if (state is Success<SliderModel>) {
          return CarouselSlider.builder(
              itemCount: state.data.data?.sliders?.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                print(
                    "obobobobob ${state.data.data!.sliders![itemIndex].image}");
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    state.data.data!.sliders![itemIndex].image ?? "m",
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                height: 150,
                viewportFraction: .8,
                initialPage: 0,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {},
              ));
        } else {
          return const Text('something wrong');
        } */