import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xbooks_store/core/theming/app_colors.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/books/logic/bloc_observer.dart';

void main() async {
  setupGetIt();

  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  runApp(XbooksAPP(
    appRouter: AppRouter(),
  ));
}

class XbooksAPP extends StatelessWidget {
  final AppRouter appRouter;

  const XbooksAPP({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 707),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Xbooks App 📚',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.teal,
            scaffoldBackgroundColor: Colors.white),
        initialRoute: Routes.navBar,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
