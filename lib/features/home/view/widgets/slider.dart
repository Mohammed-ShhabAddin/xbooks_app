import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xbooks_store/features/home/logic/home_cubit.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/shimmer_loading.dart';
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
            loading: () => const ShimmerSliderLoading(),
            success: (data) {
              List items = data.data.sliders;

              return CarouselSlider.builder(
                itemCount: items.length,
                options: CarouselOptions(
                  viewportFraction: .8,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.1,
                  enableInfiniteScroll: true,
                  height: MediaQuery.of(context).size.height * 0.2,
                  onPageChanged: (index, reason) {},
                ),
                itemBuilder: (context, index, realIdx) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        items[index].image,
                        fit: BoxFit.cover,
                      ));
                },
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

/**CarouselSlider.builder(
                itemCount: items.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            data.data.sliders[itemIndex].image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  height: MediaQuery.of(context).size.height * 0.2,
                  viewportFraction: .8,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayCurve: Curves.linear,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.1,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {},
                ),
              ); */
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


        