import 'package:fitnestx/core/di/dependency_injection.dart';
import 'package:fitnestx/core/routing/app_router.dart';
import 'package:fitnestx/fitnestx_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(FitnestxApp(appRouter: AppRouter()));
}
