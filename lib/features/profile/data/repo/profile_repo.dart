import 'package:xbooks_store/core/networking/api_service.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_results.dart';
import '../model/profile_model.dart';
import '../model/update_profile_request_body.dart';

class ProfileRepo {
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<ApiResult<Profile>> updateProfile(
      {required String token, required UpdateProfileRequestBody body}) async {
    try {
      final response = await _apiService.updateProfile(token, body);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<Profile>> showProfile({required String token}) async {
    try {
      final response = await _apiService.showProfile(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
