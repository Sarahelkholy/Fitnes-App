import 'package:fitnestx/core/di/dependency_injection.dart';
import 'package:fitnestx/core/routing/routes.dart';
import 'package:fitnestx/features/home/ui/home_screen.dart';
import 'package:fitnestx/features/login/logic/cubit/login_cubit.dart';
import 'package:fitnestx/features/login/ui/login_screen.dart';
import 'package:fitnestx/features/onboarding/ui/onboarding_scree.dart';
import 'package:fitnestx/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:fitnestx/features/signup/ui/add_user_physical_info_screen.dart';
import 'package:fitnestx/features/signup/ui/choose_goal_screen.dart';
import 'package:fitnestx/features/signup/ui/add_user_basic_info_screen.dart';
import 'package:fitnestx/features/signup/ui/signup_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments as className)
    final arguments = settings.arguments;
    switch (settings.name) {
      // onBoarding route
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      // Sign up roytes
      case Routes.addUserBasicInfoScreen:
        final cubit = getIt<SignUpCubit>();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => cubit,
            child: const AddUserBasicInfoScreen(),
          ),
        );

      case Routes.addUserPhysicalInfoScreen:
        final cubit = settings.arguments as SignUpCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: const AddUserPhysicalInfoScreen(),
          ),
        );

      case Routes.chooseGoalScreen:
        final cubit = settings.arguments as SignUpCubit;
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: cubit, child: const ChooseGoalScreen()),
        );

      case Routes.signupSuccessScreen:
        return MaterialPageRoute(builder: (_) => SignupSuccessScreen());

      // Login route
      case Routes.logInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

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
