import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  // -------------- Categories -------------- //
  void emitGetAllCategoriesStates() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getAllCategories();
    response.when(success: (allCatResponse) {
      emit(HomeState.success(allCatResponse));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  // -------------- Slider -------------- //
  void emitGetSliderDataStates() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getSliderData();
    response.when(success: (sliderResponse) {
      emit(HomeState.success(sliderResponse));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  // -------------- Product Best Seller -------------- //
  void emitGetBestSellerStates() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getBestSeller();
    response.when(success: (bestSellerResponse) {
      emit(HomeState.success(bestSellerResponse));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  // -------------- New Arrivals -------------- //
  void emitGetNewArrivalsStates() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getNewArrivals();
    response.when(success: (newArrivalsResponse) {
      emit(HomeState.success(newArrivalsResponse));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}
