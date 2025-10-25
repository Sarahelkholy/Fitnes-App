import 'package:dio/dio.dart';
import 'package:fitnestx/core/networking/api_service.dart';
import 'package:fitnestx/core/networking/dio_factory.dart';
import 'package:fitnestx/features/login/data/repo/login_repo.dart';
import 'package:fitnestx/features/signup/data/repo/sign_up_repo.dart';
import 'package:fitnestx/features/signup/logic/cubit/sign_up_cubit.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // dio & apiServer
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //  sign Up
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  //  login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
