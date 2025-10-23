import 'package:fitnestx/core/routing/app_router.dart';
import 'package:fitnestx/fitnestx_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(FitnestxApp(appRouter: AppRouter()));
}
