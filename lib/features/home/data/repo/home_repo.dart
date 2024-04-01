import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_results.dart';
import '../../../../core/networking/api_service.dart';
import '../models/categories_model.dart';
import '../models/products/bestseller_model.dart';
import '../models/products/new_arrivals.dart';
import '../models/sliders_model.dart';

class HomeRepo {
  final ApiService _apiService;
  HomeRepo(this._apiService);

  // -------------- Categories -------------- //
  Future<ApiResult<Categories>> getAllCategories() async {
    try {
      final response = await _apiService.getAllCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // -------------- Slider -------------- //
  Future<ApiResult<SliderModel>> getSliderData() async {
    try {
      final response = await _apiService.getSliderData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // -------------- Product Best Seller -------------- //
  Future<ApiResult<BestSeller>> getBestSeller() async {
    try {
      final response = await _apiService.getBestSeller();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // -------------- New Arrivals -------------- //
  Future<ApiResult<NewArrivals>> getNewArrivals() async {
    try {
      final response = await _apiService.getNewArrivals();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
