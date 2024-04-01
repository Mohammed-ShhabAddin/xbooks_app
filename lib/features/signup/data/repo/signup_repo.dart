import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_results.dart';
import '../../../../core/networking/api_service.dart';
import '../model/signup_request_body.dart';
import '../model/signup_response.dart';

class SignupRepo {
  final ApiService _apiService;
  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody singupRequestBody) async {
    try {
      final response = await _apiService.signup(singupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
