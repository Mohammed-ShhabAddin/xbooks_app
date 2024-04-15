import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xbooks_store/core/routing/routes.dart';
import 'package:xbooks_store/features/books/logic/books_cubit.dart';
import 'package:xbooks_store/features/books/view/Books_screen.dart';
import 'package:xbooks_store/features/favorite/view/favorite_screen.dart';
import 'package:xbooks_store/features/home/data/models/products/bestseller_model.dart';
import 'package:xbooks_store/features/home/logic/home_cubit.dart';
import 'package:xbooks_store/features/home/view/bestseller_details_screen.dart';
import 'package:xbooks_store/features/home/view/home_screen.dart';
import 'package:xbooks_store/features/home/view/new_arrivals_details_screen.dart';
import 'package:xbooks_store/features/profile/logic/profile_cubit.dart';
import 'package:xbooks_store/features/profile/view/editeing_profile_screen.dart';
import 'package:xbooks_store/features/profile/view/profile_screen.dart';
import 'package:xbooks_store/features/home/data/models/products/new_arrivals.dart'
    as newarrival;
import 'package:xbooks_store/features/profile/view/update_profile_screen.dart';

import '../../features/home/nav_bar.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/view/login_screen.dart';
import '../../features/signup/logic/signup_cubite.dart';
import '../../features/signup/view/signup_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );

      case Routes.navBar:
        return MaterialPageRoute(
          builder: (_) => const NavBarWidget(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );
      //
      //later on we will add Cubit here for add to favorite maype
      case Routes.bestsellerBookDetailsScreen:
        final item = arguments as Product;
        return MaterialPageRoute(
          builder: (_) => BestSellerBookDetailsScreen(
            item: item,
          ),
        );
      //
      case Routes.newArrivalsBookDetailsScreen:
        final item2 = arguments as newarrival.Product;
        return MaterialPageRoute(
          builder: (_) => NewArrivalsBookDetailsScreen(
            item: item2,
          ),
        );
      //

      case Routes.booksScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<BooksCubit>(),
            child: const BooksScreen(),
          ),
        );
      //
      case Routes.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const FavoriteScreen(),
          ),
        );
      //
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProfileCubit>()..emitShowProfileStates(),
            child: const ProfileScreen(),
          ),
        );
      //
      case Routes.editingProfileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const EditingProfile(),
          ),
        );
      case Routes.updateProfileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const UpdateProfileScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const NavBarWidget(),
        );
    }
  }
}

/** Widget build(BuildContext context) {
    return Provider<Example>(
      create: (_) => Example(),
      // Will throw a ProviderNotFoundError, because `context` is associated
      // to the widget that is the parent of `Provider<Example>`
      child: Text(context.watch<Example>().toString()),
    );
  }
  ```

  consider using `builder` like so:

  ```
  Widget build(BuildContext context) {
    return Provider<Example>(
      create: (_) => Example(),
      // we use `builder` to obtain a new `BuildContext` that has access to the provider
      builder: (context, child) {
        // No longer throws
        return Text(context.watch<Example>().toString());
      } */
