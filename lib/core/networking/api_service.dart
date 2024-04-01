import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xbooks_store/features/home/data/models/products/bestseller_model.dart';

import '../../features/home/data/models/categories_model.dart';
import '../../features/home/data/models/products/new_arrivals.dart';
import '../../features/home/data/models/sliders_model.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response.dart';
import '../../features/signup/data/model/signup_request_body.dart';
import '../../features/signup/data/model/signup_response.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

// -------------- Auth -------------- //
  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody singupRequestBody,
  );

// -------------- Categories -------------- //
  @GET(ApiConstants.categories)
  Future<Categories> getAllCategories();

  // -------------- Slider -------------- //
  @GET(ApiConstants.slider)
  Future<SliderModel> getSliderData();

  // -------------- Product Best Seller -------------- //
  @GET(ApiConstants.productBestSeller)
  Future<BestSeller> getBestSeller();

// -------------- New Arrivals -------------- //
  @GET(ApiConstants.productBestSeller)
  Future<NewArrivals> getNewArrivals();
}
