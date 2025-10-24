import 'package:fitnestx/core/routing/routes.dart';
import 'package:fitnestx/features/onboarding/ui/onboarding_scree.dart';
import 'package:fitnestx/features/signup/ui/add_user_info_screen.dart';
import 'package:fitnestx/features/signup/ui/choose_goal_screen.dart';
import 'package:fitnestx/features/signup/ui/signup_screen.dart';
import 'package:fitnestx/features/signup/ui/signup_success_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments as className)
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());

      case Routes.addUserInfoScreen:
        return MaterialPageRoute(builder: (_) => AddUserInfoScreen());

      case Routes.chooseGoalScreen:
        return MaterialPageRoute(builder: (_) => ChooseGoalScreen());

      case Routes.signupSuccessScreen:
        return MaterialPageRoute(builder: (_) => SignupSuccessScreen());

      // case Routes.loginScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<LoginCubit>(),
      //       child: const LoginScreen(),
      //     ),
      //   );
      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<SignUpCubit>(),
      //       child: const SignUpScreen(),
      //     ),
      //   );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => HomeCubit(getIt())..getSpecialization(),
      //       child: const HomeScreen(),
      //     ),
      //   );
      default:
        return null;
    }
  }
}
