import 'package:xbooks_store/features/books/data/model/products.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_results.dart';
import '../../../../core/networking/api_service.dart';

class BooksRepo {
  final ApiService _apiService;
  BooksRepo(this._apiService);

  // -------------- All Books Products V2-------------- //
  Future<ApiResult<Products>> getAllBooksProducts({required int page}) async {
    try {
      final response = await _apiService.getAllBooksProducts(page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  // // -------------- All Books Products -------------- //
  // Future<ApiResult<Products>> getAllBooksProducts() async {
  //   try {
  //     final response = await _apiService.getAllBooksProducts();
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ErrorHandler.handle(error));
  //   }
  // }

  // -------------- Searched Books  -------------- //
  Future<ApiResult<Products>> getByNameSearchedBooks(String name) async {
    try {
      final response = await _apiService.getByNameSearchedBooks(name);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
