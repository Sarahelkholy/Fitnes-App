import 'package:fitnestx/core/routing/app_router.dart';
import 'package:fitnestx/core/routing/routes.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FitnestxApp extends StatelessWidget {
  final AppRouter appRouter;
  const FitnestxApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FitnestX app',
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Appcolors.primaryColor1,
            scaffoldBackgroundColor: Colors.white,
          ),
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.onBoardingScreen,
          // initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
        );
      },
    );
  }
}
