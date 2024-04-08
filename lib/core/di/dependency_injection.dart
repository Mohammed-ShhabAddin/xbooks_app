import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:xbooks_store/features/books/data/repo/books_repo.dart';
import 'package:xbooks_store/features/books/logic/books_cubit.dart';
import 'package:xbooks_store/features/home/data/repo/home_repo.dart';
import 'package:xbooks_store/features/home/logic/home_cubit.dart';

import '../../features/login/data/repo/login_repo.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/profile/logic/profile_cubit.dart';
import '../../features/signup/data/repo/signup_repo.dart';
import '../../features/signup/logic/signup_cubite.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();

  //Api
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  //Books
  getIt.registerLazySingleton<BooksRepo>(() => BooksRepo(getIt()));
  getIt.registerFactory<BooksCubit>(() => BooksCubit(getIt()));

  //Profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
}
