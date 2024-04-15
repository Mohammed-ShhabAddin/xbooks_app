import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xbooks_store/features/home/data/models/products/bestseller_model.dart';

import '../../features/books/data/model/products.dart';
import '../../features/home/data/models/categories_model.dart';
import '../../features/home/data/models/products/new_arrivals.dart';
import '../../features/home/data/models/sliders_model.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response.dart';
import '../../features/profile/data/model/profile_model.dart';
import '../../features/profile/data/model/update_profile_request_body.dart';
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
  @GET(ApiConstants.productNewArrivals)
  Future<NewArrivals> getNewArrivals();

// -------------- All Books Products v2 -------------- //
  @GET(ApiConstants.products)
  Future<Products> getAllBooksProducts(@Query('page') int page);
// -------------- All Books Products -------------- //
  // @GET(ApiConstants.products)
  // Future<Products> getAllBooksProducts();

// --------------   Product Search -------------- //
  @GET(ApiConstants.productsSearch)
  Future<Products> getByNameSearchedBooks(@Query('name') String name);

// // --------------  update profile-------------- //
//   @POST(ApiConstants.updateProfile)
//   @MultiPart()
//   Future<Profile> updateProfile(
//     @Header('Authorization') String token,
//     @Part() UpdateProfileRequestBody body,
//   );

// --------------  update profile-------------- //
  @POST(ApiConstants.updateProfile)
  Future<Profile> updateProfile(
    @Header('Authorization') String token,
    @Body() UpdateProfileRequestBody body,
  );
// --------------  show profile-------------- //
  @GET(ApiConstants.profile)
  Future<Profile> showProfile(
    @Header('Authorization') String token,
  );
}
