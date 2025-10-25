import 'package:fitnestx/core/helpers/extentions.dart';
import 'package:fitnestx/core/routing/routes.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:fitnestx/features/signup/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(
                child: CircularProgressIndicator(
                  color: Appcolors.primaryColor1,
                ),
              ),
            );
          },
          signupSuccess: (loginResponse) {
            context.pushReplacementNamed(Routes.signupSuccessScreen);
          },
          signupError: (error) {
            Navigator.pop(context);
            _showErrorDialog(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: AppTextStyles.font14BlackBold),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Got it', style: AppTextStyles.font14BlackBold),
          ),
        ],
      ),
    );
  }
}
